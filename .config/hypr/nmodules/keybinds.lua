-- Input
hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",
        numlock_by_default = true,

        follow_mouse = 1,
        force_no_accel = 1,

        sensitivity = 0.8, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})


-- Programs
local terminal = "kitty"
local music = "lollypop"
local fileManager = "pcmanfm"
local menu = "rofi -show drun"
local browser = "firefox"
local windowls = "rofi -show window"
local powermenu = "rofi -show power-menu -modi power-menu:rofi-power-menu"
local wallpapermenu = "rofi_select_wallpaper.sh"
local notitray = "swaync-client -t -sw"
local colorpicker = "hyprpicker -a -n"
local calc = "qalculate-qt"

-- Keybinds
local mainMod = "SUPER"

-- Normal binds
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({action = "toggle"}))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd(powermenu))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({action = "toggle"}))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd(windowls))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(calc))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(notitray))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(wallpapermenu))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(colorpicker))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("steam"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(music))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Move window with mainMod + SHIFT + arrow keys
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

-- Resize with mainMod + CONTROL + arrow keys
hl.bind(mainMod .. " + CONTROL + left",  hl.dsp.window.resize({ x = "-25", y = "0" }))
hl.bind(mainMod .. " + CONTROL + right", hl.dsp.window.resize({ x = "25", y = "0" }))
hl.bind(mainMod .. " + CONTROL + up",    hl.dsp.window.resize({ x = "0", y = "-25" }))
hl.bind(mainMod .. " + CONTROL + down",  hl.dsp.window.resize({ x = "0", y = "25" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Cursor Zoom
local MAX_ZOOM = 3
local MIN_ZOOM = 1
local ZOOM_TOGGLE_FACTOR = 1.5

---@param offset number
---@return nil
local function zoom(offset)
    local current = hl.get_config("cursor.zoom_factor")
    if offset ~= nil then
        current = current + offset
    elseif current ~= MIN_ZOOM then
        current = MIN_ZOOM
    else
        current = ZOOM_TOGGLE_FACTOR
    end
    current = math.max(MIN_ZOOM, math.min(MAX_ZOOM, current))
    hl.config({ cursor = { zoom_factor = current } })
end

-- hl.bind("SUPER + Z", zoom)
hl.bind(mainMod .. " + mouse_up", function()
    zoom(0.5)
end)
hl.bind(mainMod .. " + mouse_down", function()
    zoom(-0.5)
end)

-- Multimedia
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("~/.config/hypr/nmodules/volume.sh raise"), {repeating = true})
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("~/.config/hypr/nmodules/volume.sh lower"), {repeating = true, locked = true})
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("~/.config/hypr/nmodules/volume.sh mute-toggle"), {locked = true})

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), {locked = true})
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), {locked = true})
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })

-- Screenshot
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind(mainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(mainMod .. " + CONTROL + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))
