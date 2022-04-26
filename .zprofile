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

### Apple Silicon homebrew
if [ -d /opt/homebrew ]; then
    path=("/opt/homebrew/bin" $path)
fi

# PATH="/usr/local/bin:$PATH"

### anyenv
if [ -d $HOME/.anyenv/bin ]; then
    path=($path "$HOME/.anyenv/bin")
fi
if type -a anyenv 1>/dev/null ; then
    eval "$(anyenv init -)"
fi

### Rust
if [ -f $HOME/.cargo/env ]; then
    . "$HOME/.cargo/env"
fi

### java
if /usr/libexec/java_home -v 1.8 1>/dev/null 2>&1 ; then
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
fi

### go
if [ -d $HOME/go/bin ] ; then
    path=($path "$HOME/go/bin")
fi
if [ -e /usr/local/go ] ; then
    path=($path "$HOME/usr/local/go/bin")
fi
if [ -e /usr/lib/go ]; then
    path=($path "$HOME/usr/lib/go/bin")
fi

### deno
if [ -e "$HOME/.deno" ] ; then
    export DENO_INSTALL="$HOME/.deno"
    path=("$HOME/.deno/bin" $path)
fi

### direnv
if type -a direnv 1>/dev/null ; then
    eval "$(direnv hook zsh)"
fi

path=("$HOME/.local/bin" "$HOME/bin" $path)
