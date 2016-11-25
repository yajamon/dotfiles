# auto-complete
autoload -U compinit
compinit -u

# cd support
setopt auto_cd      # auto change directory
setopt auto_pushd   # auto directory pushd that you can get dirs list by cd -[tab]

# command history support
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_all_dups # ignore duplication command history list. remove old duplication command history.
setopt share_history    # share command history data

