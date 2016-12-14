# auto-complete
autoload -U compinit
compinit -u

# prompt
PROMPT="%n:%1~%% "
PROMPT2="%_ > "

# vcs information
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

# keybind support
setopt IGNOREEOF

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

# aliases
setopt complete_aliases # aliased ls needs if file/dir completions work
alias vi="vim"
alias ls="ls -G"
alias ll="ls -lh"

alias du="du -h"
alias df="df -h"

$DOTPATH/bin/tmuxx

