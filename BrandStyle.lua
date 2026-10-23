-- BrandStyle.lua
-- Xal's Emporium
--
-- Xal's shared visual brand - dark indigo solid background + deep orange
-- accent, custom flat buttons AND checkboxes. Every border/divider line is
-- at least 2px - a 1px line can fail to render reliably depending on UI
-- scale.
--
-- Use these helpers for splash screens, settings panels, and any other
-- custom-drawn frame. Standard interactive controls that AREN'T part of this
-- brand spec (sliders, edit boxes) should still use Blizzard's native
-- templates unless MakeEditBox below is a better fit - only buttons/borders/
-- titles/checkboxes get the custom treatment.
local addonName, addonTable = ...
addonTable.BrandStyle = {}
local Brand = addonTable.BrandStyle

-- ── Colours (r, g, b) ─────────────────────────────────────────
-- Family-wide 2026-09-20 standard: ONE accent color, no exceptions - dark
-- brick red (#681417), used for titles, the one header divider, a selected
-- sidebar link, section headers, and button/link/checkbox labels. Brand.ACCENT
-- is kept as the name every existing call site in this file already uses, and
-- just points at the same table as Brand.HEADER_COLOR so both names always
-- agree - not a second color.
Brand.HEADER_COLOR = { 0.4078, 0.0784, 0.0902 }  -- #681417, dark brick red
Brand.ACCENT = Brand.HEADER_COLOR
-- Near-black indigo - every divider that ISN'T the one header divider under a
-- title, plus panel/card border edges (Brand.DrawBorder()'s default color).
Brand.DIVIDER_COLOR = { 0.0627, 0.0627, 0.1255 }  -- #101020
-- Muted blue-gray - unselected sidebar/tab links in a standalone window.
-- Selected uses Brand.HEADER_COLOR. Not consumed anywhere in this addon yet -
-- added so it's ready the moment a sidebar exists.
Brand.SIDEBAR_UNSELECTED_COLOR = { 0.196, 0.196, 0.392 }  -- #323264
Brand.GOLD   = { 0.60, 0.47, 0.30 }   -- secondary/body text tone (muted body copy)
Brand.BG     = { 0.03, 0.028, 0.06, 1 } -- dark indigo leaning purple (#08070f), fully opaque
Brand.LINE_THICKNESS = 2 -- minimum for ANY border/divider - never go below this
-- Minimum gap between a panel's true outer edge and the nearest button/text.
Brand.SAFE_MARGIN = 14

-- ── T()  ─ solid-colour texture rectangle.
-- x, y measured from the parent's TOP-LEFT corner (y increases downward).
function Brand.T(parent, x, y, w, h, r, g, b, a, layer)
    local tex = parent:CreateTexture(nil, layer or "ARTWORK")
    PixelUtil.SetPoint(tex, "TOPLEFT", parent, "TOPLEFT", x, -y)
    PixelUtil.SetSize(tex, w, h)
    tex:SetColorTexture(r, g, b, a or 1)
    return tex
end

-- ── FS()  ─ a FontString with a specific font/size/colour.
function Brand.FS(parent, text, fontPath, size, flags, r, g, b)
    local fs = parent:CreateFontString(nil, "OVERLAY")
    fs:SetFont(fontPath, size, flags or "")
    fs:SetText(text)
    fs:SetTextColor(r, g, b, 1)
    return fs
end

-- ── Font paths ────────────────────────────────────────────────
-- Header/title font: Cinzel Bold (bundled, SIL OFL). Body/label font: Inter
-- Regular/SemiBold (bundled, SIL OFL). Must ship in this addon's own Fonts/
-- folder (Fonts/Cinzel-Bold.ttf, Fonts/Inter-Regular.ttf,
-- Fonts/Inter-SemiBold.ttf, plus their LICENSE.txt files).
Brand.TITLE_FONT_PATH = "Interface\\AddOns\\XalsEmporium\\Fonts\\Cinzel-Bold.ttf"
Brand.BODY_FONT_PATH = "Interface\\AddOns\\XalsEmporium\\Fonts\\Inter-Regular.ttf"
Brand.BODY_FONT_PATH_SEMIBOLD = "Interface\\AddOns\\XalsEmporium\\Fonts\\Inter-SemiBold.ttf"

-- ── Title()  ─ the branded title treatment, with its drop-shadow layer, in
-- one call. Returns the visible (front) fontstring.
function Brand.Title(parent, text, size, anchorPoint, relTo, relPoint, x, y)
    local shadow = Brand.FS(parent, text, Brand.TITLE_FONT_PATH, size, "OUTLINE", 0, 0, 0)
    PixelUtil.SetPoint(shadow, anchorPoint, relTo, relPoint, x + 4, y - 4)
    shadow:SetJustifyH("CENTER")

    local title = Brand.FS(parent, text, Brand.TITLE_FONT_PATH, size, "OUTLINE",
        Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3])
    PixelUtil.SetPoint(title, anchorPoint, relTo, relPoint, x, y)
    title:SetJustifyH("CENTER")
    return title
end

-- Unselected label color - same as Brand.ACCENT, one unified orange for
-- both titles/borders and button labels.
local BTN_LABEL_UNSELECTED = Brand.ACCENT

-- ── MakeButton()  ─ text-link style: plain text, no fill, no border.
-- Selected vs. normal state is carried entirely by label color/brightness.
-- Call btn:SetSelected(true/false) to toggle white (selected) vs. the
-- unselected amber-orange.
function Brand.MakeButton(parent, text, w, h, onClick)
    local btn = CreateFrame("Button", nil, parent)
    PixelUtil.SetSize(btn, w, h)

    local label = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("CENTER")
    label:SetText(text)
    label:SetTextColor(BTN_LABEL_UNSELECTED[1], BTN_LABEL_UNSELECTED[2], BTN_LABEL_UNSELECTED[3], 1)
    btn.label = label

    btn:SetScript("OnEnter", function(self)
        if not self.selected then label:SetTextColor(1, 1, 1, 1) end
    end)
    btn:SetScript("OnLeave", function(self)
        if not self.selected then
            label:SetTextColor(BTN_LABEL_UNSELECTED[1], BTN_LABEL_UNSELECTED[2], BTN_LABEL_UNSELECTED[3], 1)
        end
    end)
    if onClick then btn:SetScript("OnClick", onClick) end

    function btn:SetSelected(selected)
        self.selected = selected
        if selected then
            label:SetTextColor(1, 1, 1, 1)
        else
            label:SetTextColor(BTN_LABEL_UNSELECTED[1], BTN_LABEL_UNSELECTED[2], BTN_LABEL_UNSELECTED[3], 1)
        end
    end

    function btn:SetBorderColor(r, g, bC, a)
        label:SetTextColor(r, g, bC, a)
    end

    return btn
end

-- ── MakeCloseButton()  ─ text-link style close ("Close" in accent orange,
-- brightens to white on hover). Doesn't set its own anchor point; call
-- sites position it themselves.
function Brand.MakeCloseButton(parent, onClick)
    local btn = CreateFrame("Button", nil, parent)
    btn:SetSize(50, 20)

    local label = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    label:SetPoint("CENTER")
    label:SetText("Close")
    label:SetTextColor(Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3], 1)
    btn.label = label

    btn:SetScript("OnEnter", function() label:SetTextColor(1, 1, 1, 1) end)
    btn:SetScript("OnLeave", function()
        label:SetTextColor(Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3], 1)
    end)
    btn:SetScript("OnClick", onClick or function() parent:Hide() end)

    return btn
end

-- ── MakeLinkButton()  ─ a second, deliberately plain button style for
-- inline quick-toggles (no border/fill). Hover feedback is wired via
-- HookScript, not SetScript, so a call site can still add its own
-- OnEnter/OnLeave (e.g. a tooltip) without one silently overwriting the
-- other.
function Brand.MakeLinkButton(parent)
    local btn = CreateFrame("Button", nil, parent)
    local label = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetFont(Brand.BODY_FONT_PATH, 12, "")
    label:SetPoint("CENTER")
    btn.label = label

    function btn:SetLabel(text, r, g, b)
        label:SetText(text)
        if r then label:SetTextColor(r, g, b, 1) end
        btn.baseColor = { r or Brand.ACCENT[1], g or Brand.ACCENT[2], b or Brand.ACCENT[3] }
    end

    btn:HookScript("OnEnter", function() label:SetTextColor(1, 1, 1, 1) end)
    btn:HookScript("OnLeave", function()
        local c = btn.baseColor or Brand.ACCENT
        label:SetTextColor(c[1], c[2], c[3], 1)
    end)

    return btn
end

-- ── MakeDiscordLink()  ─ the standing Discord text-link (see
-- project_discord_link_standard). Takes only the parent - it does NOT
-- position itself, same as MakeButton/MakeCloseButton; the call site sets
-- its own point (usually TOPRIGHT near the title). Do not add anchor
-- parameters to this function's signature.
Brand.DISCORD_URL = "https://discord.gg/9SwrQDJeCe"

StaticPopupDialogs["XALSEMPORIUM_COPY_URL"] = {
    text = "Copy this link:",
    button1 = "Close",
    hasEditBox = true,
    editBoxWidth = 260,
    OnShow = function(self, data)
        self.editBox:SetText(data)
        self.editBox:HighlightText()
        self.editBox:SetFocus()
    end,
    EditBoxOnEscapePressed = function(self) self:GetParent():Hide() end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
}

-- Icon-only Discord mark (official brand asset, white symbol variant), used
-- next to the text link so it pops instead of reading as plain text. Ship
-- Textures/DiscordIcon.png in this addon's own folder, copied from
-- D:\WoW_Addons\Dev\Assets\Icons\Discord-Symbol-White_64.png (already
-- resized to a game-ready size - do NOT re-source or re-download the logo,
-- and do not recolor/distort it per Discord's brand guidelines).
Brand.DISCORD_ICON = "Interface\\AddOns\\XalsEmporium\\Textures\\DiscordIcon.png"

function Brand.MakeDiscordLink(parent)
    local btn = Brand.MakeLinkButton(parent)
    btn:SetSize(92, 20)

    -- Icon sits left of the label - real aspect ratio (84x64 source)
    -- preserved so the mark doesn't look squashed at this size.
    local icon = btn:CreateTexture(nil, "ARTWORK")
    icon:SetSize(21, 16)
    icon:SetPoint("LEFT", btn, "LEFT", 0, 0)
    icon:SetTexture(Brand.DISCORD_ICON)
    btn.icon = icon

    btn.label:ClearAllPoints()
    btn.label:SetPoint("LEFT", icon, "RIGHT", 5, 0)
    btn:SetLabel("Discord", 0.45, 0.55, 0.95)

    btn:HookScript("OnEnter", function() icon:SetVertexColor(1, 1, 1, 1) end)
    btn:HookScript("OnLeave", function() icon:SetVertexColor(0.45, 0.55, 0.95, 1) end)
    icon:SetVertexColor(0.45, 0.55, 0.95, 1)

    btn:SetScript("OnClick", function()
        StaticPopup_Show("XALSEMPORIUM_COPY_URL", nil, nil, Brand.DISCORD_URL)
    end)
    return btn
end

-- ── Discord logo link ─────────────────────────────────────────────
-- The real Discord wordmark as the clickable element itself, no separate
-- text - the family's sidebar standard, pinned to the bottom of a settings
-- window's sidebar. Copied from D:\WoW_Addons\Dev\Assets\Icons\DiscordLogo.png.
-- Clicking pops our own copy-a-URL box (Brand.ShowCopyBox, defined below).
Brand.DISCORD_LOGO_ICON = "Interface\\AddOns\\XalsEmporium\\Textures\\DiscordLogo.png"
local DISCORD_LOGO_ASPECT = 42 / 280

function Brand.MakeDiscordLogoLink(parent, width)
    width = width or 140
    local btn = CreateFrame("Button", nil, parent)
    btn:SetSize(width, width * DISCORD_LOGO_ASPECT)

    local logo = btn:CreateTexture(nil, "ARTWORK")
    logo:SetAllPoints()
    logo:SetTexture(Brand.DISCORD_LOGO_ICON)
    logo:SetAlpha(0.9)
    btn.logo = logo

    btn:SetScript("OnEnter", function() logo:SetAlpha(1) end)
    btn:SetScript("OnLeave", function() logo:SetAlpha(0.9) end)
    btn:SetScript("OnClick", function()
        Brand.ShowCopyBox("Join us on Discord", Brand.DISCORD_URL)
    end)

    return btn
end

-- ── ApplyCardBackground()  ─ the fill behind a bordered settings card, a few
-- shades lighter than the window background so a card reads as a raised box.
-- Same value and helper as Welcome Wagon / Reins / Roster Roundup.
Brand.CARD_BG = { 0.082, 0.078, 0.149, 1 }

function Brand.ApplyCardBackground(f)
    local bg = f:CreateTexture(nil, "BACKGROUND", nil, -1)
    bg:SetAllPoints()
    bg:SetColorTexture(Brand.CARD_BG[1], Brand.CARD_BG[2], Brand.CARD_BG[3], Brand.CARD_BG[4])
    return bg
end

-- ── DrawBorder()  ─ single clean accent-color line around a frame.
-- Deliberately simple - no corner ornaments or tick marks. Each side is
-- anchored to BOTH ends of that edge (not a fixed x/y/w/h), so it auto-
-- stretches if the frame resizes later.
function Brand.DrawBorder(f, inset)
    inset = inset or 1
    local thick = Brand.LINE_THICKNESS
    local r, g, b = Brand.DIVIDER_COLOR[1], Brand.DIVIDER_COLOR[2], Brand.DIVIDER_COLOR[3]

    local top = f:CreateTexture(nil, "ARTWORK")
    PixelUtil.SetPoint(top, "TOPLEFT", f, "TOPLEFT", inset, -inset)
    PixelUtil.SetPoint(top, "TOPRIGHT", f, "TOPRIGHT", -inset, -inset)
    PixelUtil.SetHeight(top, thick)
    top:SetColorTexture(r, g, b, 1)

    local bottom = f:CreateTexture(nil, "ARTWORK")
    PixelUtil.SetPoint(bottom, "BOTTOMLEFT", f, "BOTTOMLEFT", inset, inset)
    PixelUtil.SetPoint(bottom, "BOTTOMRIGHT", f, "BOTTOMRIGHT", -inset, inset)
    PixelUtil.SetHeight(bottom, thick)
    bottom:SetColorTexture(r, g, b, 1)

    local left = f:CreateTexture(nil, "ARTWORK")
    PixelUtil.SetPoint(left, "TOPLEFT", f, "TOPLEFT", inset, -inset)
    PixelUtil.SetPoint(left, "BOTTOMLEFT", f, "BOTTOMLEFT", inset, inset)
    PixelUtil.SetWidth(left, thick)
    left:SetColorTexture(r, g, b, 1)

    local right = f:CreateTexture(nil, "ARTWORK")
    PixelUtil.SetPoint(right, "TOPRIGHT", f, "TOPRIGHT", -inset, -inset)
    PixelUtil.SetPoint(right, "BOTTOMRIGHT", f, "BOTTOMRIGHT", -inset, inset)
    PixelUtil.SetWidth(right, thick)
    right:SetColorTexture(r, g, b, 1)

    return top, bottom, left, right
end

-- ── DrawDivider()  ─ the thin section-separator line used between content
-- blocks (feature lists, section headers, etc.) - near-black indigo, NOT the
-- one header divider directly under a window's title (see DrawHeaderDivider).
function Brand.DrawDivider(parent, x, y, width)
    local c = Brand.DIVIDER_COLOR
    return Brand.T(parent, x, y, width, Brand.LINE_THICKNESS, c[1], c[2], c[3], 1)
end

-- ── DrawHeaderDivider()  ─ the ONE divider directly under a window's title,
-- in the brand's single accent color - every other divider uses
-- DrawDivider()/DIVIDER_COLOR instead.
function Brand.DrawHeaderDivider(parent, x, y, width)
    local c = Brand.HEADER_COLOR
    return Brand.T(parent, x, y, width, Brand.LINE_THICKNESS, c[1], c[2], c[3], 1)
end

-- ── ApplyBackground()  ─ the standard opaque near-black frame background.
function Brand.ApplyBackground(f)
    local bg = f:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(Brand.BG[1], Brand.BG[2], Brand.BG[3], Brand.BG[4])
    return bg
end

-- ── ApplyBackgroundImage()  ─ the OLD shared dark-swirl texture art. NOT
-- called by default - the default look is ApplyBackground()'s flat indigo
-- color alone, no image layered on top. Kept here only for a possible future
-- "Classic" style option. If actually used, copy Textures/PanelBackground.jpg
-- from an existing addon that has it into this addon's own Textures/ folder.
function Brand.ApplyBackgroundImage(f)
    local img = f:CreateTexture(nil, "BORDER")
    img:SetAllPoints(f)
    img:SetTexture("Interface\\AddOns\\XalsEmporium\\Textures\\PanelBackground.jpg")
    return img
end

-- ── MakeEditBox()  ─ hand-drawn text input, same 4-texture border technique
-- as MakeButton/MakeCheckbox -- no Blizzard InputBoxTemplate art, whose
-- endcap textures render wider than its SetSize.
function Brand.MakeEditBox(parent, w, h)
    h = h or 22
    local box = CreateFrame("EditBox", nil, parent)
    PixelUtil.SetSize(box, w, h)

    local bg = box:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(0.1, 0.1, 0.1, 0.6)

    local thick = Brand.LINE_THICKNESS
    local r, g, b = Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3]

    local borderTop = box:CreateTexture(nil, "ARTWORK")
    PixelUtil.SetPoint(borderTop, "TOPLEFT", box, "TOPLEFT", 0, 0)
    PixelUtil.SetPoint(borderTop, "TOPRIGHT", box, "TOPRIGHT", 0, 0)
    PixelUtil.SetHeight(borderTop, thick)
    borderTop:SetColorTexture(r, g, b, 1)

    local borderBottom = box:CreateTexture(nil, "ARTWORK")
    PixelUtil.SetPoint(borderBottom, "BOTTOMLEFT", box, "BOTTOMLEFT", 0, 0)
    PixelUtil.SetPoint(borderBottom, "BOTTOMRIGHT", box, "BOTTOMRIGHT", 0, 0)
    PixelUtil.SetHeight(borderBottom, thick)
    borderBottom:SetColorTexture(r, g, b, 1)

    local borderLeft = box:CreateTexture(nil, "ARTWORK")
    PixelUtil.SetPoint(borderLeft, "TOPLEFT", box, "TOPLEFT", 0, 0)
    PixelUtil.SetPoint(borderLeft, "BOTTOMLEFT", box, "BOTTOMLEFT", 0, 0)
    PixelUtil.SetWidth(borderLeft, thick)
    borderLeft:SetColorTexture(r, g, b, 1)

    local borderRight = box:CreateTexture(nil, "ARTWORK")
    PixelUtil.SetPoint(borderRight, "TOPRIGHT", box, "TOPRIGHT", 0, 0)
    PixelUtil.SetPoint(borderRight, "BOTTOMRIGHT", box, "BOTTOMRIGHT", 0, 0)
    PixelUtil.SetWidth(borderRight, thick)
    borderRight:SetColorTexture(r, g, b, 1)

    box:SetFont(Brand.BODY_FONT_PATH, 13, "")
    box:SetTextColor(0.9, 0.9, 0.9, 1)
    box:SetTextInsets(6, 6, 0, 0)
    box:SetAutoFocus(false)

    return box
end

-- ── MakeCheckbox()  ─ hand-drawn checkbox using the same pixel-snapped
-- 4-texture border technique as Brand.MakeButton/DrawBorder, rather than
-- Blizzard's UICheckButtonTemplate (whose art has been found to render
-- incomplete on other addons). Brand standard for checkboxes - do not use
-- UICheckButtonTemplate in new code.
--
-- Usage differs slightly from a native CheckButton: set `cb.OnToggle =
-- function(self) ... end` instead of `cb:SetScript("OnClick", ...)`, since
-- OnClick is used internally to flip the checked state before your handler
-- runs (matching the native behavior where GetChecked() already reflects
-- the NEW state inside OnClick).
function Brand.MakeCheckbox(parent, size)
    size = size or 22
    local cb = CreateFrame("Button", nil, parent)
    PixelUtil.SetSize(cb, size, size)

    local bg = cb:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(0.1, 0.1, 0.1, 0.6)

    local thick = Brand.LINE_THICKNESS
    local r, g, b = Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3]

    local borderTop = cb:CreateTexture(nil, "ARTWORK")
    PixelUtil.SetPoint(borderTop, "TOPLEFT", cb, "TOPLEFT", 0, 0)
    PixelUtil.SetPoint(borderTop, "TOPRIGHT", cb, "TOPRIGHT", 0, 0)
    PixelUtil.SetHeight(borderTop, thick)
    borderTop:SetColorTexture(r, g, b, 1)

    local borderBottom = cb:CreateTexture(nil, "ARTWORK")
    PixelUtil.SetPoint(borderBottom, "BOTTOMLEFT", cb, "BOTTOMLEFT", 0, 0)
    PixelUtil.SetPoint(borderBottom, "BOTTOMRIGHT", cb, "BOTTOMRIGHT", 0, 0)
    PixelUtil.SetHeight(borderBottom, thick)
    borderBottom:SetColorTexture(r, g, b, 1)

    local borderLeft = cb:CreateTexture(nil, "ARTWORK")
    PixelUtil.SetPoint(borderLeft, "TOPLEFT", cb, "TOPLEFT", 0, 0)
    PixelUtil.SetPoint(borderLeft, "BOTTOMLEFT", cb, "BOTTOMLEFT", 0, 0)
    PixelUtil.SetWidth(borderLeft, thick)
    borderLeft:SetColorTexture(r, g, b, 1)

    local borderRight = cb:CreateTexture(nil, "ARTWORK")
    PixelUtil.SetPoint(borderRight, "TOPRIGHT", cb, "TOPRIGHT", 0, 0)
    PixelUtil.SetPoint(borderRight, "BOTTOMRIGHT", cb, "BOTTOMRIGHT", 0, 0)
    PixelUtil.SetWidth(borderRight, thick)
    borderRight:SetColorTexture(r, g, b, 1)

    -- Texture, not a FontString "X" - Blizzard's own checkmark texture
    -- centers exactly where told, no font-metrics guesswork.
    local check = cb:CreateTexture(nil, "OVERLAY")
    check:SetTexture("Interface\\Buttons\\UI-CheckBox-Check")
    check:SetVertexColor(r, g, b, 1)
    PixelUtil.SetSize(check, size - 4, size - 4)
    check:SetPoint("CENTER", cb, "CENTER", 0, 0)
    check:Hide()

    cb.checked = false
    function cb:SetChecked(state)
        self.checked = state and true or false
        if self.checked then check:Show() else check:Hide() end
    end
    function cb:GetChecked()
        return self.checked
    end

    cb:SetScript("OnEnter", function() bg:SetColorTexture(0.18, 0.18, 0.18, 0.75) end)
    cb:SetScript("OnLeave", function() bg:SetColorTexture(0.1, 0.1, 0.1, 0.6) end)
    cb:SetScript("OnClick", function(self)
        self:SetChecked(not self.checked)
        if self.OnToggle then self.OnToggle(self) end
    end)

    return cb
end

-- ── ShowContextMenu()  ─ a right-click menu built entirely from brand
-- widgets (bordered background, text-link entries) - NOT Blizzard's
-- UIDropDownMenu/EasyMenu.
--
-- options is an array of { label, r, g, b, onClick } - r/g/b optional
-- (defaults to Brand.ACCENT).
local contextMenu, clickCatcher

function Brand.ShowContextMenu(options)
    if not clickCatcher then
        clickCatcher = CreateFrame("Button", nil, UIParent)
        clickCatcher:SetAllPoints(UIParent)
        clickCatcher:SetFrameStrata("FULLSCREEN")
        clickCatcher:Hide()
    end

    if not contextMenu then
        contextMenu = CreateFrame("Frame", nil, UIParent)
        contextMenu:SetFrameStrata("FULLSCREEN_DIALOG")
        Brand.ApplyBackground(contextMenu)
        Brand.DrawBorder(contextMenu, 4)
        contextMenu.buttons = {}
        contextMenu:Hide()
    end

    local ROW_H, PAD = 22, 10
    local width = 90
    for i, opt in ipairs(options) do
        local btn = contextMenu.buttons[i]
        if not btn then
            btn = Brand.MakeLinkButton(contextMenu)
            btn:SetHeight(ROW_H)
            contextMenu.buttons[i] = btn
        end
        btn:SetLabel(opt.label, opt.r or Brand.ACCENT[1], opt.g or Brand.ACCENT[2], opt.b or Brand.ACCENT[3])
        btn:SetPoint("TOPLEFT", contextMenu, "TOPLEFT", PAD, -PAD - (i - 1) * ROW_H)
        btn:SetScript("OnClick", function()
            clickCatcher:Hide()
            contextMenu:Hide()
            if opt.onClick then opt.onClick() end
        end)
        btn:Show()
        local w = btn.label:GetStringWidth() + 4
        if w > width then width = w end
    end
    for i = #options + 1, #contextMenu.buttons do
        contextMenu.buttons[i]:Hide()
    end
    for _, btn in ipairs(contextMenu.buttons) do btn:SetWidth(width) end

    contextMenu:SetSize(width + PAD * 2, #options * ROW_H + PAD * 2)

    local x, y = GetCursorPosition()
    local scale = UIParent:GetEffectiveScale()
    contextMenu:ClearAllPoints()
    contextMenu:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x / scale, y / scale)

    clickCatcher:Show()
    clickCatcher:SetScript("OnClick", function()
        clickCatcher:Hide()
        contextMenu:Hide()
    end)
    contextMenu:Show()
end

-- ── MakeTextLink() ───────────────────────────────────────────────
-- Plain clickable text, no border, no fill - accent-colored, brightens to
-- white on hover. A known gap in the new-addon scaffold template; ported in
-- here the first time a detail popup needed reference links (Wowhead, etc).
-- Optional fontSize switches to the body font at that size (`bold` = Inter
-- SemiBold) - same signature as Warchest's / Welcome Wagon's helper, used by
-- the settings sidebar links.
function Brand.MakeTextLink(parent, text, onClick, fontSize, bold)
    local btn = CreateFrame("Button", nil, parent)
    btn:SetHeight(fontSize and (fontSize + 10) or 20)

    local label
    if fontSize then
        label = Brand.FS(btn, text, bold and Brand.BODY_FONT_PATH_SEMIBOLD or Brand.BODY_FONT_PATH,
            fontSize, nil, Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3])
    else
        label = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        label:SetText(text)
        label:SetTextColor(Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3], 1)
    end
    label:SetPoint("CENTER")
    btn.label = label
    btn:SetWidth(math.max(40, label:GetStringWidth() + 8))

    btn:SetScript("OnEnter", function() label:SetTextColor(1, 1, 1, 1) end)
    btn:SetScript("OnLeave", function()
        label:SetTextColor(Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3], 1)
    end)
    btn:SetScript("OnClick", onClick)

    return btn
end

-- ── ShowCopyBox() ────────────────────────────────────────────────
-- Our own copy-a-URL window, replacing Blizzard's StaticPopup so it carries
-- the addon's background, border and fonts like every other frame here.
local copyFrame

function Brand.ShowCopyBox(caption, url)
    if not url or url == "" then return end

    if not copyFrame then
        local f = CreateFrame("Frame", "XalsEmporiumCopyBox", UIParent)
        f:SetSize(360, 130)
        f:SetPoint("CENTER", UIParent, "CENTER", 0, 220)
        f:SetFrameStrata("FULLSCREEN_DIALOG")
        f:SetToplevel(true)
        f:SetMovable(true)
        f:EnableMouse(true)
        f:RegisterForDrag("LeftButton")
        f:SetScript("OnDragStart", f.StartMoving)
        f:SetScript("OnDragStop", f.StopMovingOrSizing)
        f:SetClampedToScreen(true)
        tinsert(UISpecialFrames, "XalsEmporiumCopyBox")

        Brand.ApplyBackground(f)
        Brand.DrawBorder(f)

        f.caption = Brand.FS(f, "", Brand.TITLE_FONT_PATH, 15, nil,
            Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3])
        f.caption:SetPoint("TOP", f, "TOP", 0, -Brand.SAFE_MARGIN)

        local box = CreateFrame("EditBox", nil, f, "InputBoxTemplate")
        box:SetHeight(22)
        box:SetPoint("TOPLEFT", f, "TOPLEFT", Brand.SAFE_MARGIN + 10, -46)
        box:SetPoint("TOPRIGHT", f, "TOPRIGHT", -Brand.SAFE_MARGIN, -46)
        box:SetAutoFocus(true)
        box:SetFontObject("GameFontHighlightSmall")
        -- Reselect rather than allow edits: this is for copying, not typing.
        box:SetScript("OnTextChanged", function(self)
            if self.locked then return end
            self.locked = true
            self:SetText(f.url or "")
            self:HighlightText()
            self.locked = false
        end)
        box:SetScript("OnEscapePressed", function() f:Hide() end)
        f.box = box

        local hint = Brand.FS(f, "Ctrl+C to copy", Brand.BODY_FONT_PATH, 11, nil, 0.6, 0.6, 0.6)
        hint:SetPoint("TOPLEFT", box, "BOTTOMLEFT", 2, -6)

        local close = Brand.MakeCloseButton(f, function() f:Hide() end)
        close:SetPoint("BOTTOM", f, "BOTTOM", 0, Brand.SAFE_MARGIN)

        copyFrame = f
    end

    copyFrame.url = url
    copyFrame.caption:SetText(caption or "Copy this link")
    copyFrame.box.locked = true
    copyFrame.box:SetText(url)
    copyFrame.box.locked = false
    copyFrame:Show()
    copyFrame.box:SetFocus()
    copyFrame.box:HighlightText()
end
