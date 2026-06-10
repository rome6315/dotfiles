-- monitors

-- Viewsonic 144 Hz
hl.monitor({
    output = "DP-2",
    mode = "highrr",
    position = "2560x-0", -- to the right
    scale = 1,
})

-- AOC 240 Hz
hl.monitor({
    output = "DP-1",
    mode = "2560x1440@200",
    position = "0x0",
    vrr = 2, -- make sure to cap monitor at below max fps both in this config and in-game
    scale = 1,
})

-- keyboard and mouse
hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        touchpad = {
            natural_scroll = false,
        },
        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
        accel_profile = "flat", -- disable mouse accel
    },
})

