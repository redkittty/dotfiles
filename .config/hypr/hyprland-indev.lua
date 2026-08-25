-- Vixbe's Hyprland Config

-- Autostart
hl.on("hyprland.start", fuction()
  hl.exec_cmd("waybar"),
  hl.exec_cmd("awww-daemon"),
  hl.exec_cmd("swaync"),
  hl.exec_cmd("nm-applet"),
  hl.exec_cmd("hypridle"),
  hl.exec_cmd("systemctl --user start hyprpolkitagent"),
  hl.exec_cmd("hyprsunset"),
  hl.exec_cmd("swayosd-server"),
  hl.exec_cmd("udiskie -a -T"),
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"),

  -- User Programs
  hl.exec_cmd("vesktop --enable-blink-features=MiddleClickAutoscroll & steam"),
end)

-- Misc
hl.config({
  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = true,
  },
})

-- Programs
local terminal = "kitty"
local music = "lollypop"
local fileManager = "pcmanfm"
local menu = "rofi -show drun"
local browser = "firefox"
local windowls = "rofi -show window"
local powermenu = "rofi -show power-menu -modi powermenu:rofi-power-menu"
local wallpapermenu = "rofi_select_wallpaper.sh"
local notitray = "swaync-client -t -sw"
local colorpicker = "hyprpicker -a -n"
local calc = "qalculate-qt"
local osd = "swayosd-client --monitor "$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')""

-- Modules
require("nmodules/keybinds.lua")
