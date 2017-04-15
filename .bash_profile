
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
if type -a brew 1>/dev/null 2>&1 ; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
fi

# load .bashrc
if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi
