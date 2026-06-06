# Functions needed for !! and !$
  function __history_previous_command
    switch (commandline -t)
    case "!"
      commandline -t $history[1]; commandline -f repaint
    case "*"
      commandline -i !
    end
end