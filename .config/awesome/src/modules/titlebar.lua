local awful = require("awful")
local wibox = require("wibox")
local dpi = require("beautiful").xresources.apply_dpi
local gears = require("gears")

-- {{{ Titlebars
-- Add a titlebar if titlebars_enabled is set to true in the rules.

local double_click_timer = nil

local double_click_event_handler = function(double_click_event)
    if double_click_timer then
        double_click_timer:stop()
        double_click_timer = nil
        double_click_event()
        return
    end
    double_click_timer = gears.timer.start_new(0.20, function()
        double_click_timer = nil
        return false
    end)
end

local create_click_events = function(c)
    local buttons = gears.table.join(awful.button({}, 1, function()
        double_click_event_handler(function()
            if c.floating then
                c.float = false
                return
            end
            c.maximized = not c.maximized
            c:raise()
        end)
        c:activate{context = 'titlebar', action = 'mouse_move'}
    end), awful.button({}, 3, function()
        c:activate{context = 'titlebar', action = 'mouse_resize'}
    end))
    return buttons
end

local create_titlebar = function(c)
    local titlebar = awful.titlebar(c, {size = 36})

    titlebar:setup{
        {
            {widget = awful.titlebar.widget.titlewidget(c)},
            margins = dpi(5),
            widget = wibox.container.margin
        },

        {
            buttons = create_click_events(c),
            layout = wibox.layout.flex.horizontal
        },

        {
            {

                {
                    awful.titlebar.widget.maximizedbutton(c),
                    widget = wibox.container.background,
                    bg = "#ffcc00",
                    shape = function(cr, height, width)
                        gears.shape.circle(cr, width, height)
                    end,
                    id = "maximizebutton"
                },
                {
                    awful.titlebar.widget.minimizebutton(c),
                    widget = wibox.container.background,
                    bg = "#00ff00",
                    shape = function(cr, height, width)
                        gears.shape.circle(cr, width, height)
                    end,
                    id = "minimizebutton"
                },
                {
                    awful.titlebar.widget.closebutton(c),
                    widget = wibox.container.background,
                    bg = "#ff0000",
                    shape = function(cr, height, width)
                        gears.shape.circle(cr, width, height)
                    end,
                    id = "closebutton"
                },
                spacing = dpi(10),
                layout = wibox.layout.fixed.horizontal,
                id = "spacing"
            },
            margins = dpi(8),
            widget = wibox.container.margin,
            id = "margin"
        },

        layout = wibox.layout.align.horizontal,
        id = "main"
    }
    Hover_signal(titlebar.main.margin.spacing.closebutton, "#ffcc00", "#000000")
end
-- }}}

client.connect_signal("request::titlebars", function(c) create_titlebar(c) end)
