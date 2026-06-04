-- animations
hl.curve("wind", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("winIn", { type = "bezier", points = { { 0.1, 1.1 }, { 0.1, 1.1 } } })
hl.curve("winOut", { type = "bezier", points = { { 0.3, -0.3 }, { 0, 1 } } })
hl.curve("liner", { type = "bezier", points = { { 1, 1 }, { 1, 1 } } })
hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("smoothOut", { type = "bezier", points = { { 0.5, 0 }, { 0.99, 0.99 } } })
hl.curve("smoothIn", { type = "bezier", points = { { 0.5, -0.5 }, { 0.68, 1.5 } } })
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 6,
    bezier = "wind",
    style = "slide",
})
hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 5,
    bezier = "winIn",
    style = "slide",
})
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 3,
    bezier = "smoothOut",
    style = "slide",
})
hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 5,
    bezier = "wind",
    style = "slide",
})
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 1,
    bezier = "liner",
})
hl.animation({
    leaf = "borderangle",
    enabled = true,
    speed = 100,
    bezier = "liner",
    style = "loop",
})
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3,
    bezier = "smoothOut",
})
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 5,
    bezier = "overshot",
})
hl.animation({
    leaf = "workspacesIn",
    enabled = true,
    speed = 5,
    bezier = "winIn",
    style = "slide",
})
hl.animation({
    leaf = "workspacesOut",
    enabled = true,
    speed = 5,
    bezier = "winOut",
    style = "slide",
})
hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 3.81,
    bezier = "easeOutQuint",
})
hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuint",
    style = "popin 50%",
})
hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 3,
    bezier = "easeOutQuint",
    style = "slide",
})
hl.config({
    animations = {
        enabled = true,
    },
})


