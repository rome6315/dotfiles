-- colors and decorations
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 5,
        border_size = 3,
	col = {
            active_border = primary,
        },
        --col.active_border = rgb(6f00ff) rgb(9370db) 45deg #these are hex values
       -- layout = "master",
    },
    decoration = {
        screen_shader = "~/.config/hypr/shaders/vibrance.gsl",
        rounding = 3,
        shadow = {
            enabled = false,
            range = 10,
            render_power = 1,
            color = "rgba(162, 151, 215, 1)",
            color_inactive = "rgba(1a1a1aee)",
        },
	},
})

