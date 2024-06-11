# NOTICE: IF YOU WANT TO EDIT THIS CONFIG, EDIT IT THROUGH README.org, NOT THROUGH config.py
import os
import subprocess

from libqtile import bar, layout, qtile, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen, KeyChord
from libqtile.lazy import lazy
# YOU NEED QTILE-EXTRAS
from qtile_extras import widget
from qtile_extras.widget.decorations import BorderDecoration
# Distrotube's Colors Library
import colors

terminal = "kitty"
browser = "brave"
steam = "steam"
emacs = "emacsclient -c -a 'emacs'"

## ROFI ##
launcher = "rofi -show drun"
emoji = "rofi -show emoji"
power = "powermenu.sh"
wifi = "rofi-wifi-menu"
calculator = "rofi -show calc"
altab = "rofi -show window"

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.Popen([home])

colors = colors.GruvboxDark

mod = "mod4"
keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "Left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "Left", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "Right", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "Down", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "Up", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "b", lazy.spawn(browser), desc="Launch web browser"),
    Key([mod], "t", lazy.spawn(emacs), desc="Launch Emacs"),
    Key([mod], "g", lazy.spawn(steam), desc="Launch Steam"),
    Key([mod], "Print", lazy.spawn("flameshot screen -n 1"), desc="Takes Screenshot of Primary Monitor"),

    # Toggle between different layouts as defined below
    Key([mod], "l", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "c", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod], "v", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    ## ROFI ##
    Key([mod], "r", lazy.spawn(launcher), desc="Rofi Run Launcher"),
    Key([mod], "e", lazy.spawn(emoji), desc="Rofi Emoji Picker"),
    Key([mod], "p", lazy.spawn(power), desc="Rofi Power Menu"),
    Key([mod], "w", lazy.spawn(wifi), desc="Rofi Wifi Menu"),
    Key([mod], "equal", lazy.spawn(calculator), desc="Rofi Calculator"),
    Key([mod], "Tab", lazy.spawn(altab), desc="Rofi Window Switcher"),

    # Volume Control
    Key([], "XF86AudioRaiseVolume", lazy.spawn("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")),
    Key([], "XF86AudioMute", lazy.spawn("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")),
]

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )


groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod1 + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=False),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.MonadTall(border_focus_stack = colors[2], border_width = 1),
    layout.Columns(border_focus_stack = colors[2], border_width = 1),
    layout.Tile(border_focus_stack = colors[2], border_width = 1),
    layout.Max(border_focus_stack = colors[2], border_width = 1),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(border_focus_stack = colors[2], border_width = 4),
    # layout.Matrix(border_focus_stack = colors[2], border_width = 4),
    # layout.MonadWide(border_focus_stack = colors[2], border_width = 4),
    # layout.RatioTile(border_focus_stack = colors[2], border_width = 4),
    # layout.TreeTab(border_focus_stack = colors[2], border_width = 4),
    # layout.VerticalTile(border_focus_stack = colors[2], border_width = 4**layout_theme),
    # layout.Zoomy(border_focus_stack = colors[2], border_width = 4),
]

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
    background=colors[0]
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        wallpaper='~/.local/share/wall/wall5.jpg',
        wallpaper_mode='stretch',
        top=bar.Bar(
            [
                widget.GroupBox(
                    fontsize = 11,
                    margin_y = 5,
                    margin_x = 5,
                    padding_y = 0,
                    padding_x = 1,
                    borderwidth = 3,
                    active = colors[8],
                    inactive = colors[1],
                    rounded = False,
                    highlight_color = colors[2],
                    highlight_method = "line",
                    this_current_screen_border = colors[7],
                    this_screen_border = colors [4],
                    other_current_screen_border = colors[7],
                    other_screen_border = colors[4],
                ),
                widget.TextBox(
                    text = '|',
                    font = "Ubuntu Mono",
                    foreground = colors[1],
                    padding = 2,
                    fontsize = 14
                ),
                widget.Prompt(),
                widget.WindowName(
                    foreground = colors[6],
                    max_chars = 40
                ),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Systray(),
                widget.Spacer(length = 8),
                widget.KeyboardLayout(
                    foreground = colors[1],
                    fmt = '   KEY:  {}',
                    decorations=[
                        BorderDecoration(
                            colour = colors[1],
                            border_width = [0, 0, 2, 0],
                        )
                    ],
                ),
                widget.Spacer(length = 8),
                widget.CPU(
                    format = '   CPU: {load_percent}%',
                    foreground = colors[3],
                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e htop')},
                    decorations=[
                        BorderDecoration(
                            colour = colors[3],
                            border_width = [0, 0, 2, 0],
                        )
                    ],
                ),
                widget.Spacer(length = 8),
                widget.Memory(
                    foreground = colors[5],
                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e htop')},
                    format = '{MemUsed: .0f}{mm}',
                    fmt = '  MEM: {} used',
                    decorations=[
                        BorderDecoration(
                            colour = colors[5],
                            border_width = [0, 0, 2, 0],
                        )
                    ],
                ),
                widget.Spacer(length = 8),
                #widget.CheckUpdates(
                #    update_interval = 1800,
                #    display_format = '   PKG: {updates}',
                #    no_update_string='   PKG: No Updates',
                #    foreground = colors[6],
                #    distro = 'Arch_checkupdates'
                #    execute = "kitty -e sudo pacman -Syu",
                #    decorations=[
                #        BorderDecoration(
                #            colour = colors[6],
                #            border_width = [0, 0, 2, 0],
                #        )
                #    ],
                #),
                #widget.Spacer(length = 8),
                widget.Clock(
                    format="   TIME: %a, %b, %d - %I:%M %p",
                    foreground = colors[8],
                    decorations=[
                        BorderDecoration(
                            colour = colors[8],
                            border_width = [0, 0, 2, 0],
                        )
                    ],

                ),
                widget.Spacer(length = 8),
                widget.CurrentLayoutIcon(
                    # custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                    padding = 4,
                    scale = 0.6,
                    decorations=[
                        BorderDecoration(
                            colour = colors[1],
                            border_width = [0, 0, 2, 0],
                        )
                    ],
                ),
                widget.CurrentLayout(
                    decorations=[
                        BorderDecoration(
                            colour = colors[1],
                            border_width = [0, 0, 2, 0],
                        )
                    ],
                ),
                widget.Spacer(length = 6),

            ],
            27,
        ),
    ),
    Screen(
        wallpaper="~/.local/share/wall/wall5.jpg",
        wallpaper_mode="stretch",

    ),
]

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False

floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

wmname = "LG3D"
