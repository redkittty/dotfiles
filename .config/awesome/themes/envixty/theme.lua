---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = os.getenv("HOME") ..
                    "/.config/awesome/themes/"

local theme = {}

theme.font          = "sans 8.5"

theme.bg_normal     = "#282828"
theme.bg_focus      = "#504945"
theme.bg_urgent     = "#FB4934"
theme.bg_minimize   = "#32302F"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#7C6F64"
theme.fg_focus      = "#FBF1C7"
theme.fg_urgent     = "#FB4934"
theme.fg_minimize   = "#ebdbb2"

theme.useless_gap   = dpi(0)
theme.border_width  = dpi(1)
theme.border_normal = "#1D2021"
theme.border_focus  = "#83A598"
theme.border_marked = "#CC241D"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."envixty/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."envixty/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."envixty/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."envixty/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."envixty/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."envixty/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."envixty/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."envixty/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."envixty/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."envixty/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."envixty/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."envixty/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."envixty/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."envixty/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."envixty/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."envixty/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."envixty/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."envixty/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."envixty/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."envixty/titlebar/maximized_focus_active.png"

theme.wallpaper = "~/.local/share/wall/wall4.jpeg"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path .. "envixty/layouts/fairhw.png"
theme.layout_fairv = themes_path .. "envixty/layouts/fairvw.png"
theme.layout_floating  = themes_path .. "envixty/layouts/floatingw.png"
theme.layout_magnifier = themes_path .. "envixty/layouts/magnifierw.png"
theme.layout_max = themes_path .. "envixty/layouts/maxw.png"
theme.layout_fullscreen = themes_path .. "envixty/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path .. "envixty/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path .. "envixty/layouts/tileleftw.png"
theme.layout_tile = themes_path .. "envixty/layouts/tilew.png"
theme.layout_tiletop = themes_path .. "envixty/lsyouts/tiletopw.png"
theme.layout_spiral  = themes_path .. "envixty/layouts/spiralw.png"
theme.layout_dwindle = themes_path .. "envixty/layouts/dwindlew.png"
theme.layout_cornernw = themes_path .. "envixty/layouts/cornernww.png"
theme.layout_cornerne = themes_path .. "envixty/layouts/cornernew.png"
theme.layout_cornersw = themes_path .. "envixty/layouts/cornersww.png"
theme.layout_cornerse = themes_path .. "envixty/layouts/cornersew.png"

-- Lain Layout icons
theme.lain_icons         = os.getenv("HOME") ..
                           "/.config/awesome/lain/icons/layout/zenburn/"
theme.layout_termfair    = theme.lain_icons .. "termfair.png"
theme.layout_centerfair  = theme.lain_icons .. "centerfair.png"  -- termfair.center
theme.layout_cascade     = theme.lain_icons .. "cascade.png"
theme.layout_cascadetile = theme.lain_icons .. "cascadetile.png" -- cascade.tile
theme.layout_centerwork  = theme.lain_icons .. "centerwork.png"
theme.layout_centerworkh = theme.lain_icons .. "centerworkh.png" -- centerwork.horizontal


-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "~/.local/share/icons/Papirus-Dark"

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
