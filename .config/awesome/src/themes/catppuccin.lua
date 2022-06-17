---------------------------
-- Default awesome theme --
---------------------------
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local variants = {
    macchiato = {
        base = '#24273a',
        surface = '#494d64',
        overlay = '#8087a2',
        muted = '#6e6a86',
        subtle = '#a5adcb',
        text = '#b8c0e0',
        flamingo = '#f6c177',
        pink = '#f5bde6',
        mauve = '#c6a0f6',
        red = '#ed8796',
        maroon = '#ee99a0',
        peach = '#f5a97f',
        yellow = '#eed49f',
        green = '#a6da95',
        teal = '#8bd5ca',
        sky = '#91d7e3',
        sapphire = '#7dc4e4',
        blue = '#8aadf4',
        lavender = '#b7bdf8'
    }
}

local theme = {}

local current_variant = variants.macchiato

theme.font = "JetBrains Mono Nerd Font 11"

theme.bg_normal = current_variant.base
theme.bg_focus = current_variant.surface
theme.bg_urgent = current_variant.red
theme.bg_minimize = theme.bg_normal
theme.bg_systray = theme.bg_normal

theme.fg_normal = current_variant.text
theme.fg_focus = current_variant.text
theme.fg_urgent = current_variant.base
theme.fg_minimize = current_variant.subtle

theme.useless_gap = dpi(4)
theme.border_width = dpi(0)
theme.border_normal = "#000000"
theme.border_focus = "#535d6c"
theme.border_marked = "#91231c"

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
-- theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
                                taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
                                  taglist_square_size, theme.fg_normal)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

theme.notification_bg = current_variant.overlay
theme.notification_fg = current_variant.text

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
-- theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path ..
                                         "default/titlebar/close_normal.png"
theme.titlebar_close_button_focus = themes_path ..
                                        "default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path ..
                                            "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = themes_path ..
                                           "default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path ..
                                                  "default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = themes_path ..
                                                 "default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path ..
                                                "default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = themes_path ..
                                               "default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path ..
                                                   "default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = themes_path ..
                                                  "default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path ..
                                                 "default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = themes_path ..
                                                "default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path ..
                                                     "default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = themes_path ..
                                                    "default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path ..
                                                   "default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = themes_path ..
                                                  "default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path ..
                                                      "default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = themes_path ..
                                                     "default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path ..
                                                    "default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = themes_path ..
                                                   "default/titlebar/maximized_focus_active.png"

theme.wallpaper = themes_path .. "default/background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path .. "default/layouts/fairhw.png"
theme.layout_fairv = themes_path .. "default/layouts/fairvw.png"
theme.layout_floating = themes_path .. "default/layouts/floatingw.png"
theme.layout_magnifier = themes_path .. "default/layouts/magnifierw.png"
theme.layout_max = themes_path .. "default/layouts/maxw.png"
theme.layout_fullscreen = themes_path .. "default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path .. "default/layouts/tilebottomw.png"
theme.layout_tileleft = themes_path .. "default/layouts/tileleftw.png"
theme.layout_tile = themes_path .. "default/layouts/tilew.png"
theme.layout_tiletop = themes_path .. "default/layouts/tiletopw.png"
theme.layout_spiral = themes_path .. "default/layouts/spiralw.png"
theme.layout_dwindle = themes_path .. "default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path .. "default/layouts/cornernww.png"
theme.layout_cornerne = themes_path .. "default/layouts/cornernew.png"
theme.layout_cornersw = themes_path .. "default/layouts/cornersww.png"
theme.layout_cornerse = themes_path .. "default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height,
                                               theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
