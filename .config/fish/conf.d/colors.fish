# Use terminal palette colors (ANSI colors 0-15)
set -g fish_color_command green          # valid commands
set -g fish_color_error red              # errors / unknown commands
set -g fish_color_param normal           # command arguments
set -g fish_color_keyword blue           # keywords (if, for, etc.)
set -g fish_color_builtin cyan           # builtins (cd, echo, etc.)
set -g fish_color_operator yellow        # operators (&& || etc.)
set -g fish_color_redirection yellow     # redirections (> >>)
set -g fish_color_comment brblack       # comments
set -g fish_color_quote yellow           # quoted strings
set -g fish_color_autosuggestion brblack # ghost autosuggestions
set -g fish_color_valid_path --underline # valid paths get underlined