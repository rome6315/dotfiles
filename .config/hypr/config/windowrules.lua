-- window rules
hl.window_rule({
    name = "windowrule-1",
    match = {
        class = "timeshift-gtk",
    },
    float = true,
    size = "1000 600",
    center = true,
})

hl.window_rule({
    name = "windowrule-2",
    match = {
        class = "Bitwarden",
    },
    float = true,
    move = "800 206",
    size = "1000 600",
})

hl.window_rule({
    name = "windowrule-3",
    match = {
        class = "pcmanfm",
    },
    float = true,
    center = true,
})

-- define custom class name so that kitty will open floating only from the waybar modules
hl.window_rule({
    name = "windowrule-4",
    match = {
        class = "kittyfloat",
    },
    float = true,
    center = true,
    size = "1000 600",
})

hl.window_rule({
    name = "windowrule-5",
    match = {
        class = "pcmanfm",
    },
    size = "1000 600",
})

hl.window_rule({
    name = "windowrule-6",
    match = {
        fullscreen = 1,
    },
    idle_inhibit = "fullscreen",
})

hl.window_rule({
    name = "windowrule-7",
    match = {
        title = "YouTube Music",
    },
    idle_inhibit = "always",
})

-- make steam stop closing when you fullscreen a game. tbh not sure which one of these three rules does the trick, so I just keep them all
hl.window_rule({
    name = "windowrule-8",
    match = {
        title = "Steam",
    },
    float = false,
})

hl.window_rule({
    name = "windowrule-9",
    match = {
        title = "Steam",
        class = "steam",
    },
    min_size = "1 1",
    -- TODO: manual review — unmapped window rule action: "move"
    no_anim = true,
})

hl.window_rule({
    name = "windowrule-10",
    match = {
        class = "cstrike_linux64",
    },
    fullscreen = true,
})

