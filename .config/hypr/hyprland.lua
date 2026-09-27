-- Vixbe's Hyprland Config

-- Autostart
hl.on("hyprland.start", function()
  hl.exec_cmd("waybar")
  hl.exec_cmd("awww-daemon")
  hl.exec_cmd("swaync")
  hl.exec_cmd("nm-applet")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  hl.exec_cmd("hyprsunset")
  hl.exec_cmd("swayosd-server")
  hl.exec_cmd("udiskie -a -T")
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

  -- User Programs
  hl.exec_cmd("vesktop --enable-blink-features=MiddleClickAutoscroll & steam")

  hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme Adwaita")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
end)

-- Misc
hl.config({
  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = true,
--    midde_click_paste = false,
  },
})

-- local osd = "swayosd-client --monitor "$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')

-- Nvidia
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

-- Other env
hl.env("XCURSOR_SIZE", "28")
hl.env("HYPRCURSOR_SIZE", "28")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_THEME", "hypr_Bibata-Modern-Classic")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- Modules
require("nmodules.keybinds")
require("nmodules.decorations")
require("nmodules.monitors")
require("nmodules.permissions")
require("nmodules.windowrules")
