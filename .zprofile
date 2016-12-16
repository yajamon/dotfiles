# dotfilesへのパスを定義
if [[ -z $DOTPATH ]]; then
    export DOTPATH="$HOME/dotfiles"
fi

export LANG=ja_JP.UTF-8
PATH="/usr/local/bin:$PATH"

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

# java
if [ -e /usr/libexec/java_home ] ; then
    export JAVA_HOME=$(/usrllibexec/java_home -v 1.8)
fi
