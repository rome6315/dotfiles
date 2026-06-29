local mainMod = "SUPER"
-- hyprland utility keybinds
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

-- application specific keybinds
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("~/.config/waybar/scripts/launch.sh")) -- reload waybar
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("bitwarden-desktop"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("rofi -show drun"))
-- hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("~/.config/scripts/theme-switcher/rofi_select_theme.sh"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("rofi -show power-menu -modi power-menu:~/.local/bin/powermenu")) -- launch powermenu
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("~/.config/rofi/wallpaper-selector/walset.sh")) -- open wallpaper selector
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("~/.config/rofi/waybar-selector/waybar-selector.sh")) -- open waybar selector


-- move focus with SUPER + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end


-- move windows around within a workspace 
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "d" }))

-- scroll through existing workspaces with SUPER + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- move/resize windows with SUPER + lmb/rmb and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

-- screenshot with grim and slurp
hl.bind(
    mainMod .. " + SHIFT + s",
    hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy && notify-send "Screenshot" "Copied selected area to clipboard"')
)

-- make window fullscreen
hl.bind(mainMod .. " + SHIFT + f", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- get definition from the highlighted word
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("~/.config/scripts/definition_lookup.sh"))
