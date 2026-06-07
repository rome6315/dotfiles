alias vim='nvim' 
alias grep='rg' # changing grep to ripgrep
alias find='fd' # changing find to fd
alias cat='bat' # changing cat to bat
alias c='codium'

# changing "ls" to "eza"
alias ls='eza -la --color=always --group-directories-first' # my preferred listing
alias la='eza -a --color=always --group-directories-first'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first'  # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'