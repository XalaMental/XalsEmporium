-- ChatCommands.lua
-- Xal's Emporium - slash command handling.
--
-- This is the power-user fallback, not the main way in. Any real feature
-- this addon gets later needs a real visual control as its primary
-- interface - a chat command alone is never "done" for this addon.

local addonName, addonTable = ...
local ChatCommands = addonTable.ChatCommands

local ACCENT = "|cffb84c00"
local WHITE  = "|cffffffff"
local RESET  = "|r"

local function Say(msg)
    print(ACCENT .. "Xal's Emporium:" .. RESET .. " " .. (msg or ""))
end

local function Line(msg)
    print("  " .. (msg or ""))
end

local function PrintHelp()
    Say("commands:")
    Line(WHITE .. "/xemp options" .. RESET .. " - open the settings window")
    Line(WHITE .. "/xemp collection" .. RESET .. " - open your decor collection")
    Line(WHITE .. "/xemp" .. RESET .. " - show this help list")
end

function ChatCommands:Handle(input)
    input = (input or ""):gsub("^%s+", ""):gsub("%s+$", "")
    local cmd = input:match("^(%S*)")
    cmd = (cmd or ""):lower()

    if cmd == "options" or cmd == "config" or cmd == "settings" then
        addonTable.SettingsPanel:Open()
    elseif cmd == "collection" then
        addonTable.CollectionWindow:Toggle()
    else
        PrintHelp()
    end
end

SLASH_XALSEMPORIUM1 = "/xemp"
SlashCmdList["XALSEMPORIUM"] = function(input)
    ChatCommands:Handle(input)
end
