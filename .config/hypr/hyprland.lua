-- main config file
require("config.keybinds")
require("config.autostarts")
require("config.workspaces")
require("config.windowrules")
require("config.peripherals")
require("config.animations")
require("config.env_variables")
local colors = require("colors")

hl.monitor({
    output = "DP-2",
    mode = "1920x1080@144",
    position = "0x-1080",
    scale = "1",
})

hl.monitor({
    output = "DP-1",
    mode = "1920x1080@165",
    position = "0x0",
    scale = "1",
})

hl.config({
    general = {
	layout = "master",
	gaps_in = 5,
        gaps_out = 5,
        border_size = 3,
	col = {
            active_border = { colors = {colors.primary, colors.tertiary}, angle = 90 },
        },
    },
    decoration = {
        screen_shader = "~/.config/hypr/shaders/vibrance.gsl",
        rounding = 3,
    },
    dwindle = {
        preserve_split = true, -- you probably want this
    },
    master = {
        new_status = "slave",
    },
})

