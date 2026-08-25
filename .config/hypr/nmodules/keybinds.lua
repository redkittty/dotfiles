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
hl.bind(mainMod .. " + CONTROL + left",  hl.dsp.window.resize({ x = "-25" y = "0" }))
hl.bind(mainMod .. " + CONTROL + right", hl.dsp.window.resize({ x = "25" y = "0" }))
hl.bind(mainMod .. " + CONTROL + up",    hl.dsp.window.resize({ x = "0" y = "-25" }))
hl.bind(mainMod .. " + CONTROL + down",  hl.dsp.window.resize({ x = "0" y = "25" }))

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





