-- main config file
require("config.keybinds")
require("config.autostarts")
require("config.workspaces")
require("config.windowrules")
require("config.peripherals")
require("config.animations")
require("config.env_variables")
local colors = require("colors")

-- theming
hl.config({
    general = {
	layout = "master",
	gaps_in = 5,
        gaps_out = 5,
        border_size = 0,
	col = {
            --active_border = { colors = {colors.primary, colors.tertiary}, angle = 90 },
        },
    },
    decoration = {
        screen_shader = "~/.config/hypr/shaders/vibrance.glsl",
        rounding = 10,
    },
    dwindle = {
        preserve_split = true, -- you probably want this
    },
    master = {
        new_status = "slave",
    },
})

