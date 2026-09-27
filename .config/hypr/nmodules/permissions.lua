-- Permissions

hl.config({
   ecosystem = {
     enforce_permissions = true,
     no_update_news = true,
   },
})

hl.permission("/usr/lib/xdg-desktop-portal-hyprland", "screencopy", "allow")
hl.permission("/usr/bin/discord", "screencopy", "allow")
hl.permission("/usr/bin/hyprlock", "screencopy", "allow")
hl.permission("/usr/bin/hyprpicker", "screencopy", "allow")
hl.permission("/usr/bin/hyprpm", "plugin", "allow")
hl.permission("/var/lib/flatpak/exports/bin/com.obsproject.Studio", "screencopy", "allow")
