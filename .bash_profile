# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# ls
export LSCOLORS='gxfxcxdxbxegedabagacad'

# load bash_completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# load .bashrc
if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi
