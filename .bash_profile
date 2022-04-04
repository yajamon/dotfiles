#dotfile path
if [[ -z $DOTPATH ]]; then
    export DOTPATH="$HOME/dotfiles"
fi
. "$DOTPATH"/etc/lib/util.sh

# less config
export LESS='-i -M -R'

# anyenv
if [ -d $HOME/.anyenv/bin ]; then
    PATH="$HOME/.anyenv/bin:$PATH"
fi
if type -a anyenv 1>/dev/null ; then
    eval "$(anyenv init -)"
fi

# ls
export LSCOLORS='gxfxcxdxbxegedabagacad'

# User commands
PATH="$HOME/bin:$PATH"

# export
export PATH

# load bash_completion
if is_osx ; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
else
    if [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# load .bashrc
if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi

. "$HOME/.cargo/env"
