-- Engine.lua
-- Xal's Emporium - startup and saved variables.
--
-- The decor scan is event-driven, not a login scan (see DecorData.lua) - the
-- housing catalog only has anything to read once the player has opened it.

local addonName, addonTable = ...
local Engine = addonTable.Engine

local frame = CreateFrame("Frame")

local function EnsureDB()
    if type(XalsEmporiumDB) ~= "table" then XalsEmporiumDB = {} end
end

function Engine:Init()
    EnsureDB()

    addonTable.SettingsPanel:Init()
    addonTable.MinimapButton:Register()
    addonTable.DecorZoneAlertIcon:Init()

    addonTable.WhatsNew:CheckAndShow()
end

-- The three housing events below fire in bursts while the catalog populates
-- (confirmed pattern from real-world addon reference) - a trailing debounce
-- means one scan per burst instead of one per event.
local decorTimer
local function ScheduleDecorScan()
    if decorTimer then decorTimer:Cancel() end
    decorTimer = C_Timer.NewTimer(4, function()
        decorTimer = nil
        addonTable.DecorData:Build()
    end)
end

frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("HOUSING_STORAGE_UPDATED")
frame:RegisterEvent("HOUSING_STORAGE_ENTRY_UPDATED")
frame:RegisterEvent("HOUSING_CATALOG_CATEGORY_UPDATED")
frame:SetScript("OnEvent", function(_, event)
    if event == "PLAYER_LOGIN" then
        Engine:Init()
    else
        ScheduleDecorScan()
    end
end)
