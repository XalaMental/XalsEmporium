-- MinimapButton.lua
-- Xal's Emporium
--
-- The minimap launcher icon, via LibDataBroker + LibDBIcon - the same
-- combination almost every WoW addon with a minimap button uses.
--
-- Left-click opens the Decor Collection window (the primary feature),
-- right-click opens options - matches the convention every other Xal's
-- addon's minimap button uses (Reins, Roster Roundup: left = main window,
-- right = options).
local addonName, addonTable = ...
local MinimapButton = addonTable.MinimapButton

-- Full custom-shaped icon rather than Blizzard's circular border/mask, using
-- LibDBIcon's SetButtonSize/RemoveButtonBorder/RemoveButtonBackground/
-- SetButtonIcon. Explicit .png extension - an extensionless path leaves it
-- ambiguous which file to resolve to if a stale .tga ever sits alongside a
-- newer .png with the same base name, and WoW will happily keep loading the
-- old one.
local MINIMAP_ICON = "Interface\\AddOns\\XalsEmporium\\Textures\\MinimapIcon_House1.png"
local MINIMAP_ICON_SIZE = 34

function MinimapButton:Register()
    -- With Xal's Keep installed, the Keep's rook is the one minimap button
    -- for the whole collection suite - this addon lives under it instead of
    -- adding a button of its own.
    if XalsKeep then return end

    local ldb = LibStub("LibDataBroker-1.1"):NewDataObject("XalsEmporium", {
        type = "launcher",
        text = "Xal's Emporium",
        icon = MINIMAP_ICON,
        OnClick = function(_, button)
            if button == "RightButton" then
                if addonTable.SettingsPanel and addonTable.SettingsPanel.Open then
                    addonTable.SettingsPanel:Open()
                end
            else
                if addonTable.CollectionWindow and addonTable.CollectionWindow.Toggle then
                    addonTable.CollectionWindow:Toggle()
                end
            end
        end,
        OnTooltipShow = function(tooltip)
            tooltip:AddLine("Xal's Emporium")

            local DecorData = addonTable.DecorData
            if DecorData then
                DecorData:Ensure() -- triggers a scan if nothing's been built this session yet
                local stats = DecorData.stats
                    or (type(XalsEmporiumDB) == "table" and XalsEmporiumDB.lastKnownStats)
                if stats and stats.total and stats.total > 0 then
                    tooltip:AddLine("|cffffffff" .. stats.owned .. "|r of |cffffffff" ..
                        stats.total .. "|r decor collected")
                else
                    tooltip:AddLine("|cff999999Open the housing catalog once to scan your decor|r")
                end
            end

            tooltip:AddLine("|cff999999Left-click|r to open your decor collection")
            tooltip:AddLine("|cff999999Right-click|r for options")
        end,
    })

    XalsEmporiumDB.minimap = XalsEmporiumDB.minimap or { hide = false }
    local icon = LibStub("LibDBIcon-1.0")
    icon:Register("XalsEmporium", ldb, XalsEmporiumDB.minimap)

    if icon.SetButtonSize then
        icon:SetButtonSize("XalsEmporium", MINIMAP_ICON_SIZE)
        icon:RemoveButtonBorder("XalsEmporium")
        icon:RemoveButtonBackground("XalsEmporium")
        icon:SetButtonIcon("XalsEmporium", MINIMAP_ICON, MINIMAP_ICON_SIZE, "CENTER", 0, 0)
    end
end

-- Backing the Options "Lock position" checkbox - LibDBIcon's own Lock/Unlock,
-- which also stops the button being dragged around the minimap.
function MinimapButton:SetLocked(locked)
    XalsEmporiumDB.minimap = XalsEmporiumDB.minimap or { hide = false }
    XalsEmporiumDB.minimap.lock = locked and true or false

    local icon = LibStub("LibDBIcon-1.0", true)
    if not icon then return end
    if locked then icon:Lock("XalsEmporium") else icon:Unlock("XalsEmporium") end
end

-- Backing the Options checkbox - LibDBIcon's own Show/Hide API, not a manual
-- texture toggle, so it stays consistent with how the library expects its
-- icon's visibility to be controlled.
function MinimapButton:SetShown(shown)
    XalsEmporiumDB.minimap = XalsEmporiumDB.minimap or { hide = false }
    XalsEmporiumDB.minimap.hide = not shown

    local icon = LibStub("LibDBIcon-1.0", true)
    if not icon then return end

    if shown then
        icon:Show("XalsEmporium")
    else
        icon:Hide("XalsEmporium")
    end
end
