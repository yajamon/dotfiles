echo "load .zshrc" >&2

#dotfile path
if [[ -z $DOTPATH ]]; then
    export DOTPATH="$HOME/dotfiles"
fi
# libs
source $DOTPATH/etc/lib/util.sh

# auto-complete
autoload -U compinit
compinit -u

# prompt
PROMPT="(*'v'):%1~%% "
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
if is_osx; then
    alias ls="ls -G"
else
    alias ls="ls --color"
fi
alias ll="ls -lh"

alias du="du -h"
alias df="df -h"

alias dirs="dirs -v"

test type -a tree >/dev/null && alias tree="tree -A"

alias gitadd="git add"
alias gitcommit="git commit"

# functions
# gitignore.io : https://github.com/joeblau/gitignore.io
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# setup script
for script in $(ls $DOTPATH/etc/setup_scripts)
do
    source $DOTPATH/etc/setup_scripts/$script
done

$DOTPATH/bin/tmuxx


# added by travis gem
[ -f /Users/t-kasamatsu/.travis/travis.sh ] && source /Users/t-kasamatsu/.travis/travis.sh
