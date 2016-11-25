# anyenv
if [ -d $HOME/.anyenv/bin ]; then
    PATH="$HOME/.anyenv/bin:$PATH"
fi
if type -a anyenv; then
    eval "$(anyenv init -)"
fi

# ls
export LSCOLORS='gxfxcxdxbxegedabagacad'

# User commands
PATH="$HOME/bin:$PATH"

# export
export PATH

# load bash_completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# load .bashrc
if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi
