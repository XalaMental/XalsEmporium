-- DecorData.lua
-- Xal's Emporium - the housing decor data layer.
--
-- Housing decor (Patch 12.0, Midnight) has no offline database anywhere -
-- Blizzard publishes the catalog of what decor EXISTS but never publishes
-- what an account OWNS anywhere outside the running client. C_HousingCatalog
-- is the only source in the world for that, so this reads it live rather than
-- shipping a static item list like MountData does for mounts.
--
-- The catalog only actually populates once the player has opened the real
-- in-game housing catalog UI at least once this session - there is nothing
-- useful to read before that, so this is event-driven, never a login scan.
--
-- Every C_HousingCatalog name here comes from Blizzard's own client and a
-- verified real-world addon reference (warband-pro's decor PR, confirmed
-- against the actual API names), not guessed from memory.

local addonName, addonTable = ...
local DecorData = addonTable.DecorData

DecorData.roster = nil   -- array of entries, sorted by name
DecorData.byID   = nil   -- itemID -> entry
DecorData.stats  = nil   -- { owned = n, total = n, unmatched = n }

-- The searcher itself - created once and held here for the lifetime of the
-- session, never a local inside RunSearch(). A locally-scoped searcher has no
-- guaranteed owner between RunSearch() returning and its async callback
-- firing, so a persistent searcher the GC can't reclaim mid-flight,
-- configured once and reused for every search, is the real fix.
local searcher

-- Builds (once) and fully configures the persistent searcher.
--
-- CreateCatalogSearcher lives in Blizzard_HousingDashboard, an on-demand
-- addon that doesn't load until something asks for it - normally the player
-- opening Blizzard's own housing panel. Decor ownership itself is
-- account-wide and doesn't need that panel open, but the SEARCH API this
-- file reads it through does need that addon loaded at least once this
-- session - so load it ourselves rather than wait on the player.
--
-- CONFIRMED LIVE (2026-10-01): CreateCatalogSearcher()'s return value is a
-- userdata object (a C-backed object exposing its methods through a
-- metatable), NOT a plain Lua table. A `type(s) ~= "table"` check here was
-- silently discarding a perfectly good, working searcher on every call -
-- this was the actual bug behind the collection staying empty, confirmed via
-- live debug output, not guessed from another addon's source.
local function EnsureSearcher()
    if searcher then return searcher end

    if C_AddOns and C_AddOns.IsAddOnLoaded and not C_AddOns.IsAddOnLoaded("Blizzard_HousingDashboard") then
        pcall(C_AddOns.LoadAddOn, "Blizzard_HousingDashboard")
    end

    local cat = C_HousingCatalog
    if not cat or not cat.CreateCatalogSearcher then return nil end

    local ok, s = pcall(cat.CreateCatalogSearcher)
    if not ok or s == nil then return nil end

    searcher = s
    return searcher
end

-- Confirmed working live with this minimal config (2026-10-01) - an earlier
-- attempt modeled on a much more elaborate third-party per-tag-group filter
-- setup also returned real results once the userdata bug above was fixed,
-- but that tag-group loop adds real risk for no benefit here (a group list
-- that comes back empty would silently filter out everything again), so it's
-- left out in favor of this simpler, directly-confirmed set.
local function ConfigureSearcher(s)
    pcall(s.SetAutoUpdateOnParamChanges, s, false)
    pcall(s.SetOwnedOnly, s, false)
    pcall(s.SetStoredOnly, s, false)
    pcall(s.SetBaseVariantOnly, s, true)
    if Enum.HouseEditorMode then
        pcall(s.SetEditorModeContext, s, Enum.HouseEditorMode.BasicDecor)
    end
    pcall(s.SetCollected, s, true)
    pcall(s.SetUncollected, s, true)
    pcall(s.SetFirstAcquisitionBonusOnly, s, false)
    pcall(s.SetSearchText, s, "")
    pcall(s.SetAutoUpdateOnParamChanges, s, true)
end

-- Runs one catalog search and hands back a list of {itemID, name, icon,
-- isOwned} entries (base variants only, so a red chair and a green chair
-- count once, not twice). Async under the hood - results arrive either
-- through the callback or, if the searcher answered from a warm cache, may
-- never fire one at all - so both paths are covered.
local function RunSearch(onDone)
    local s = EnsureSearcher()
    if not s then
        onDone(nil)
        return
    end

    ConfigureSearcher(s)

    local finished = false
    local function Finish()
        if finished then return end
        finished = true

        local ok2, items = pcall(s.GetCatalogSearchResults, s)
        if not ok2 or type(items) ~= "table" then
            onDone(nil)
            return
        end

        local seen, entries, unmatched = {}, {}, 0
        for i = 1, #items do
            local entry = items[i]
            local infoOk, info = pcall(C_HousingCatalog.GetCatalogEntryInfo, entry)
            local itemID = infoOk and info and tonumber(info.itemID)
            if itemID and not seen[itemID] then
                seen[itemID] = true
                local owned = (tonumber(info.totalNumStored) or 0)
                    + (tonumber(info.totalNumPlaced) or 0)
                    + (tonumber(info.remainingRedeemable) or 0) > 0
                entries[#entries + 1] = {
                    itemID      = itemID,
                    name        = info.name,
                    icon        = info.iconTexture,
                    sourceText  = info.sourceText,
                    categoryIDs = info.categoryIDs,
                    isOwned     = owned,
                }
            elseif not itemID then
                unmatched = unmatched + 1
            end
        end

        onDone(entries, unmatched)
    end

    pcall(s.SetResultsUpdatedCallback, s, Finish)
    pcall(s.RunSearch, s)

    -- A warm cache can resolve before or without ever calling back - covered
    -- either way since Finish() no-ops the second time.
    local inProgress = select(2, pcall(s.IsSearchInProgress, s))
    if inProgress ~= true then Finish() end
end

-- Rebuilds the whole roster - every decor item in the catalog, each flagged
-- with whether this account owns it - from a single search pass (ownership
-- comes from each entry's own stored/placed/redeemable counts, not a second
-- owned-only search).
function DecorData:Build()
    RunSearch(function(all, unmatched)
        -- A real catalog always has thousands of entries - an empty result
        -- means the catalog's filter tag groups haven't finished streaming in
        -- yet (or the housing catalog UI hasn't been opened this session),
        -- not that the account owns nothing. Leaving self.stats untouched
        -- (rather than caching an empty result as final) is what lets
        -- Ensure() try again later, instead of permanently showing "0 of 0".
        if not all or #all == 0 then return end

        local roster, byID, ownedCount = {}, {}, 0
        for i = 1, #all do
            local entry = all[i]
            if entry.isOwned then ownedCount = ownedCount + 1 end
            roster[#roster + 1] = entry
            byID[entry.itemID] = entry
        end

        table.sort(roster, function(a, b)
            return (a.name or "") < (b.name or "")
        end)

        self.lastScan = time()
        self.roster = roster
        self.byID   = byID
        self.stats  = {
            owned     = ownedCount,
            total     = #roster,
            unmatched = unmatched or 0,
        }

        -- Cache just the counts (not the full roster - names/icons are
        -- cheap to re-fetch, no reason to duplicate them into
        -- SavedVariables) so the minimap tooltip has a real number to
        -- show at next login before the catalog's been opened again.
        if type(XalsEmporiumDB) == "table" then
            XalsEmporiumDB.lastKnownStats = { owned = ownedCount, total = #roster }
        end

        if addonTable.CollectionWindow and addonTable.CollectionWindow.Refresh then
            addonTable.CollectionWindow:Refresh()
        end
        if addonTable.DecorZoneAlertIcon and addonTable.DecorZoneAlertIcon.UpdateVisibility then
            addonTable.DecorZoneAlertIcon:UpdateVisibility()
        end
    end)
end

-- Builds on first use if nothing has triggered a scan yet this session.
function DecorData:Ensure()
    if not self.stats then self:Build() end
    return self.roster
end

-- ── Category grouping ────────────────────────────────────────────
-- C_HousingCatalog.GetCategories()/GetCategoryInfo(cat) name the catalog's
-- own real categories (Seating, Lighting, Storage, etc.) - reading these
-- rather than inventing a category scheme means nothing is grouped wrong and
-- nothing new Blizzard adds ever falls outside a known bucket.
local categoryNames

local function BuildCategoryIndex()
    if categoryNames then return categoryNames end
    categoryNames = {}

    local cat = C_HousingCatalog
    if not cat or not cat.GetCategories or not cat.GetCategoryInfo then
        return categoryNames
    end

    local ok, categories = pcall(cat.GetCategories)
    if not ok or type(categories) ~= "table" then return categoryNames end

    for i = 1, #categories do
        local infoOk, info = pcall(cat.GetCategoryInfo, categories[i])
        if infoOk and info and info.name then
            categoryNames[categories[i]] = info.name
        end
    end
    return categoryNames
end

-- The first category listed for an entry, or "Uncategorized" if the game
-- doesn't give one.
function DecorData:CategoryFor(entry)
    local ids = entry and entry.categoryIDs
    if not ids or #ids == 0 then return "Uncategorized" end

    local names = BuildCategoryIndex()
    return names[ids[1]] or "Uncategorized"
end

-- Groups a list into named, alphabetically-ordered sections. Every entry
-- lands in exactly one section, so summing every section's count always adds
-- back up to the full list - nothing silently dropped.
function DecorData:GroupByCategory(list)
    local buckets, names = {}, {}
    for i = 1, #list do
        local entry = list[i]
        local key = self:CategoryFor(entry)
        local bucket = buckets[key]
        if not bucket then
            bucket = {}
            buckets[key] = bucket
            names[#names + 1] = key
        end
        bucket[#bucket + 1] = entry
    end

    table.sort(names, function(a, b)
        if a == "Uncategorized" then return false end
        if b == "Uncategorized" then return true end
        return a < b
    end)

    local sections = {}
    for i = 1, #names do
        sections[#sections + 1] = { name = names[i], entries = buckets[names[i]] }
    end
    return sections
end

-- ── Current zone matching ────────────────────────────────────────
-- The catalog carries no zone field of its own, so this reads the same
-- structured labelled lines Reins' MountData reads out of the mount journal's
-- source text ("Zone: Ardenweald", "Location: Tomb of Sargeras") and matches
-- them against where the player actually is right now.
local function CleanValue(v)
    if not v then return nil end
    v = v:gsub("|n.*$", "")
    v = v:gsub("|c%x%x%x%x%x%x%x%x", "")
    v = v:gsub("|r", "")
    v = v:gsub("|H.-|h(.-)|h", "%1")
    v = v:gsub("|T.-|t", "")
    v = v:gsub("|A.-|a", "")
    v = v:gsub("\194\160", " ")
    v = v:gsub("^%s+", ""):gsub("%s+$", "")
    if v == "" then return nil end
    return v
end

-- The hand-researched DecorSources.lua entry for this item, if one exists,
-- keyed by the item's exact name.
function DecorData:GetSourceEntry(entry)
    local sources = addonTable.DecorSources
    if not sources or not entry or not entry.name then return nil end
    return sources[entry.name]
end

-- Hand-researched zone takes priority over the game's own sourceText label -
-- it's more likely to be a real, specific place name (DecorSources is
-- researched from real vendor/quest-giver locations, not generated text).
function DecorData:GetSourceZone(entry)
    local src = self:GetSourceEntry(entry)
    if src and src.zone then return src.zone end

    local source = entry and entry.sourceText
    if not source or source == "" then return nil end

    local labels = {}
    if type(ZONE) == "string" and ZONE ~= "" then labels[#labels + 1] = ZONE end
    labels[#labels + 1] = "Zone"
    if type(LOCATION_COLON) == "string" and LOCATION_COLON ~= "" then
        labels[#labels + 1] = (LOCATION_COLON:gsub(":%s*$", ""))
    end
    labels[#labels + 1] = "Location"

    for i = 1, #labels do
        local zone = CleanValue(source:match(labels[i] .. ":%s*([^\r\n]+)"))
        if zone then return zone end
    end
    return nil
end

-- This entry's real vendor coordinates for the player's own faction, if
-- DecorSources has them - or nil if this item has no fixed-position source
-- (a plain drop, for instance).
function DecorData:GetVendorCoords(entry)
    local src = self:GetSourceEntry(entry)
    if not src then return nil end

    local faction = UnitFactionGroup and UnitFactionGroup("player")
    if faction == "Horde" and src.hordeX and src.hordeY then
        return src.hordeX, src.hordeY, src.hordeZone or src.zone
    end
    if src.x and src.y then
        return src.x, src.y, src.zone
    end
    return nil
end

-- This entry's real uiMapID for the player's own faction, if DecorSources
-- has one - or nil. mapID is cross-referenced from HousingDecorGuide's own
-- maintained vendor database (real, verified per-NPC map IDs, not guessed or
-- derived from the zone name string) and only present where that cross-
-- reference found an exact match - most vendors have one, some don't, same
-- "best-effort, not a guaranteed hit" rule as everything else in this file.
--
-- When an entry has no mapID of its own (no exact match in that database),
-- the zone name is resolved to one: first from the mapIDs this same file
-- already carries for other vendors in that exact zone, then - only if the
-- zone appears nowhere with a mapID - from the client's own map list
-- (C_Map.GetMapInfo), first exact name match. Cached per zone.
local zoneMapIndex

local function ZoneMapID(zone)
    if not zone or zone == "" then return nil end

    if not zoneMapIndex then
        zoneMapIndex = {}
        for _, s in pairs(addonTable.DecorSources or {}) do
            if s.zone and s.mapID and not zoneMapIndex[s.zone] then
                zoneMapIndex[s.zone] = s.mapID
            end
            if s.hordeZone and s.hordeMapID and not zoneMapIndex[s.hordeZone] then
                zoneMapIndex[s.hordeZone] = s.hordeMapID
            end
        end
    end

    local cached = zoneMapIndex[zone]
    if cached ~= nil then return cached or nil end

    local found = false
    if C_Map and C_Map.GetMapInfo then
        for id = 1, 3500 do
            local ok, info = pcall(C_Map.GetMapInfo, id)
            if ok and info and info.name == zone then
                found = id
                break
            end
        end
    end
    zoneMapIndex[zone] = found
    return found or nil
end

function DecorData:GetVendorMapID(entry)
    local src = self:GetSourceEntry(entry)
    if not src then return nil end

    local faction = UnitFactionGroup and UnitFactionGroup("player")
    if faction == "Horde" and src.hordeX and src.hordeY then
        return src.hordeMapID or ZoneMapID(src.hordeZone or src.zone)
    end
    return src.mapID or ZoneMapID(src.zone)
end

-- The player's own position as 0-100 coordinates on their CURRENT map, plus
-- that map's zone name - or nil if the client can't report one right now
-- (e.g. inside an instance with no map).
function DecorData:GetPlayerPosition()
    if not C_Map or not C_Map.GetBestMapForUnit then return nil end

    local mapID = C_Map.GetBestMapForUnit("player")
    if not mapID then return nil end

    local pos = C_Map.GetPlayerMapPosition(mapID, "player")
    if not pos then return nil end

    local x, y = pos:GetXY()
    if not x or not y then return nil end

    local info = C_Map.GetMapInfo and C_Map.GetMapInfo(mapID)
    return x * 100, y * 100, info and info.name
end

function DecorData:CurrentZoneNames()
    local names = {}
    local function add(v)
        if v and v ~= "" then names[#names + 1] = v:lower() end
    end

    add(GetRealZoneText())
    add(GetZoneText())
    add(GetSubZoneText())

    local instanceName, instanceType = GetInstanceInfo()
    if instanceType and instanceType ~= "none" then
        add(instanceName)
    end

    return names
end

-- Labelled zone match only - a decor with no labelled zone (drop/quest source
-- with only prose) is left out of the zone filter rather than false-matched
-- against unrelated prose text.
function DecorData:MatchesCurrentZone(entry, zoneNames)
    zoneNames = zoneNames or self:CurrentZoneNames()
    if #zoneNames == 0 then return false end

    local sourceZone = self:GetSourceZone(entry)
    if not sourceZone then return false end

    sourceZone = sourceZone:lower()
    for i = 1, #zoneNames do
        if sourceZone == zoneNames[i] or sourceZone:find(zoneNames[i], 1, true) then
            return true
        end
    end
    return false
end

-- Among the missing decor matching the player's current zone, the one whose
-- real vendor position is actually closest - a genuine straight-line
-- distance, computed from the player's live map position against
-- DecorSources' researched coordinates, ONLY for entries that are on the
-- SAME map the player is currently standing on (comparing across different
-- maps needs a world-position library this addon doesn't carry).
--
-- Falls back to the first zone match when nothing in the zone has known
-- coordinates - still correct, just not distance-ranked.
function DecorData:ClosestZoneEntry()
    local roster = self:Ensure()
    if not roster then return nil end

    local zoneNames = self:CurrentZoneNames()
    local px, py, playerZone = self:GetPlayerPosition()

    local best, bestDist, firstMatch = nil, nil, nil
    for i = 1, #roster do
        local entry = roster[i]
        if not entry.isOwned and self:MatchesCurrentZone(entry, zoneNames) then
            if not firstMatch then firstMatch = entry end

            if px and py and playerZone then
                local vx, vy, vzone = self:GetVendorCoords(entry)
                if vx and vy and vzone and vzone:lower():find(playerZone:lower(), 1, true) then
                    local dist = ((vx - px) ^ 2 + (vy - py) ^ 2) ^ 0.5
                    if not bestDist or dist < bestDist then
                        best, bestDist = entry, dist
                    end
                end
            end
        end
    end

    return best or firstMatch
end
