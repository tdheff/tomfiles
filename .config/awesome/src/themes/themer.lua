local beautiful = require("beautiful")
local gears = require("gears")
local settings = require("src.settings")

local themer = {}

function themer.set_theme()
    if not beautiful.init(gears.filesystem.get_configuration_dir() ..
                              "src/themes/" .. settings.theme .. ".lua") then
        beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
    end
end

return themer
