-- Window Rules

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Steam W2
hl.window_rule({match = {class = "^(steam)$"}, workspace = "2"})
-- Discord W9
hl.window_rule({match = {class = "^(vesktop)$"}, workspace = "9"})
-- OBS W8
hl.window_rule({match = {class = "^(com.obsproject.Studio)$"}, workspace = "8"})

-- Float
hl.window_rule({match = {class = "org.prismlauncher.PrismLauncer"}, float = true})
hl.window_rule({match = {class = "class:org.pulseaudio.pavucontrol"}, float = true})
hl.window_rule({match = {class = "com.saivert.pwvucontrol"}, float = true})
hl.window_rule({match = {class = "mpv"}, float = true})
hl.window_rule({match = {class = "Sxiv"}, float = true})
hl.window_rule({match = {class = "HedgeModManager.UI"}, float = true})
hl.window_rule({match = {class = "nm-connection-editor"}, float = true})
hl.window_rule({match = {class = "dolphin-emu"}, float = true})
hl.window_rule({match = {class = "rpcs3"}, float = true})
hl.window_rule({match = {title = "RSDKv5"}, float = true})
hl.window_rule({match = {class = "pcsx2-qt"}, float = true})
hl.window_rule({match = {title = "Protontricks"}, float = true})
hl.window_rule({match = {class = "io.github.Qalculate.qalculate-qt"}, float = true})
hl.window_rule({match = {class = "org.duckstation.DuckStation"}, float = true})
hl.window_rule({match = {class = "blueman-manager"}, float = true})
hl.window_rule({match = {class = "xdg-desktop-portal-gtk"}, float = true})

hl.window_rule({match = {title = "Steam Settings"}, float = true})
hl.window_rule({match = {title = "Add Non-Steam Game"}, float = true})
hl.window_rule({match = {title = "Friends List"}, float = true})
