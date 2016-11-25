export LANG=ja_JP.UTF-8

# ls
export LSCOLORS='gxfxcxdxbxegedabagacad'

# anyenv
if [ -d $HOME/.anyenv/bin ]; then
    PATH="$HOME/.anyenv/bin:$PATH"
fi
if type -a anyenv 1>/dev/null ; then
    eval "$(anyenv init -)"
fi

PATH="$HOME/bin:$PATH"
export PATH
