-- window rules
hl.window_rule({
    name = "Btrfs Assistant",
    match = {
        class = "btrfs-assistant",
    },
    float = true,
    size = "1000 600",
    center = true,
})

hl.window_rule({
    name = "Bitwarden",
    match = {
        class = "Bitwarden",
    },
    float = true,
    move = "800 206",
    size = "1000 600",
})

hl.window_rule({
    name = "Thunar",
    match = {
        class = "thunar",
    },
    float = true,
    center = true,
    size = "1000 600",
})

-- define custom class name so that kitty will open floating only from the waybar modules
hl.window_rule({
    name = "Float Apps in Kitty",
    match = {
        class = "kittyfloat",
    },
    float = true,
    center = true,
    size = "1000 600",
})

hl.window_rule({
    name = "Idle Inhibit for Games",
    match = {
        fullscreen = 1,
    },
    idle_inhibit = "fullscreen",
})

hl.window_rule({
    name = "Idle Inhibit for YouTube Music",
    match = {
        title = "YouTube Music",
    },
    idle_inhibit = "always",
})

-- make steam stop closing when you fullscreen a game. tbh not sure which one of these three rules does the trick, so I just keep them all
hl.window_rule({
    name = "Steam1",
    match = {
        title = "Steam",
    },
    float = false,
})

hl.window_rule({
    name = "Steam2",
    match = {
        title = "Steam",
        class = "steam",
    },
    min_size = "1 1",
    -- TODO: manual review — unmapped window rule action: "move"
    no_anim = true,
})
