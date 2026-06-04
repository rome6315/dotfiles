-- set cursor. XCURSOR_THEME and XCURSOR_SIZE are also set to the exact same thing, and I also ran gsettings set org.gnome.desktop.interface cursor-theme 'Capitaine Cursors'. If you dont do all of these things, apps will start crashing on startup because of something to do with not being able to grab a cursor.

hl.env("HYPRCURSOR_THEME", "Capitaine Cursors")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Capitaine Cursors")
hl.env("XCURSOR_SIZE", "24")
