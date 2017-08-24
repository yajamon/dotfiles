if [[ -n $TMUX ]]; then
    return 0
fi

# dotfilesへのパスを定義
if [[ -z $DOTPATH ]]; then
    export DOTPATH="$HOME/dotfiles"
fi

export LANG=ja_JP.UTF-8
PATH="/usr/local/bin:$PATH"


# 自作の補完関数群
export FPATH="${HOME}/functions:$FPATH"


# ls
export LSCOLORS='gxfxcxdxbxegedabagacad'

# anyenv
if [ -d $HOME/.anyenv/bin ]; then
    PATH="$HOME/.anyenv/bin:$PATH"
fi
if type -a anyenv 1>/dev/null ; then
    eval "$(anyenv init -)"
fi

if [ -f $HOME/.local/export_path.sh ]; then
    . $HOME/.local/export_path.sh
fi

# Rust
if [ -d $HOME/.cargo/bin ]; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

# java
if [ -e /usr/libexec/java_home ]; then
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
fi

# go
if [ -e /usr/local/go ]; then
    PATH="$PATH:/usr/local/go/bin"
    export GOPATH="$HOME/.go"
fi

PATH="$HOME/bin:$PATH"
export PATH

