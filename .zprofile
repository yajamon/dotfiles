umask 022

# if [[ -n $TMUX ]]; then
#     return 0
# fi

# dotfilesへのパスを定義
if [[ -z $DOTPATH ]]; then
    export DOTPATH="$HOME/dotfiles"
fi
# libs
source $DOTPATH/etc/lib/util.sh

## PATH settings

typeset -U path PATH

# PATH="/usr/local/bin:$PATH"

### anyenv
if [ -d $HOME/.anyenv/bin ]; then
    path=($path "$HOME/.anyenv/bin")
fi
if type -a anyenv 1>/dev/null ; then
    eval "$(anyenv init -)"
fi

### Rust
if [ -d $HOME/.cargo/bin ]; then
    path=("$HOME/.cargo/bin" $path)
fi

### java
if [ -e /usr/libexec/java_home ]; then
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
fi

### go
if [ -e /usr/local/go ] ; then
    path=($path "$HOME/go/bin")
    path=($path "$HOME/usr/local/go/bin")
fi
if [ -e /usr/lib/go ]; then
    path=($path "$HOME/go/bin")
    path=($path "$HOME/usr/lib/go/bin")
fi

path=("$HOME/.local/bin" "$HOME/bin" $path)
