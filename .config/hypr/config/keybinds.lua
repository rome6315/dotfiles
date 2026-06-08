-- hyprland utility keybinds
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + M", hl.dsp.exit())
hl.bind("SUPER + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + P", hl.dsp.window.pseudo())

-- application specific keybinds
hl.bind("SUPER + W", hl.dsp.exec_cmd("~/.config/waybar/scripts/launch.sh")) -- reload waybar
hl.bind("SUPER + Return", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + F", hl.dsp.exec_cmd("thunar"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("bitwarden-desktop"))
hl.bind("SUPER + X", hl.dsp.exec_cmd("firefox"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("rofi -show drun"))
-- hl.bind("SUPER + T", hl.dsp.exec_cmd("~/.config/scripts/theme-switcher/rofi_select_theme.sh"))
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("rofi -show power-menu -modi power-menu:~/.local/bin/powermenu")) -- launch powermenu
hl.bind("SUPER + T", hl.dsp.exec_cmd("~/.config/rofi/wallpaper-selector/walset.sh")) -- open wallpaper selector
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd("~/.config/rofi/waybar-selector/waybar-selector.sh")) -- open waybar selector


-- move focus with SUPER + arrow keys
hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))

-- switch workspaces with SUPER + [0-9]
hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = 6 }))


-- move active window to a workspace with SUPER + shift + [0-9]
hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))


-- move windows around within a workspace 
hl.bind("SUPER + SHIFT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + down", hl.dsp.window.move({ direction = "d" }))

-- scroll through existing workspaces with SUPER + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- move/resize windows with SUPER + lmb/rmb and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize())

-- screenshot with grimblast
hl.bind("SUPER + SHIFT + s", hl.dsp.exec_cmd("grimblast --notify copy area"))
hl.bind("SUPER + SHIFT + m", hl.dsp.exec_cmd("grimblast --notify save output"))

-- make window fullscreen
hl.bind("SUPER + SHIFT + f", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- get definition from the highlighted word
hl.bind("SUPER + D", hl.dsp.exec_cmd("~/.config/scripts/definition_lookup.sh"))
