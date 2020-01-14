umask 022

if [[ -n $TMUX ]]; then
    return 0
fi

# dotfilesへのパスを定義
if [[ -z $DOTPATH ]]; then
    export DOTPATH="$HOME/dotfiles"
fi
# libs
source $DOTPATH/etc/lib/util.sh

## PATH settings

typeset -U path

# PATH="/usr/local/bin:$PATH"

### anyenv
if [ -d $HOME/.anyenv/bin ]; then
    PATH="$PATH:$HOME/.anyenv/bin"
fi
if type -a anyenv 1>/dev/null ; then
    eval "$(anyenv init -)"
fi

### local scope
if [ -f $HOME/.local/export_path.sh ]; then
    . $HOME/.local/export_path.sh
fi

### Rust
if [ -d $HOME/.cargo/bin ]; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

### java
if [ -e /usr/libexec/java_home ]; then
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
fi

### go
if [ -e /usr/local/go ] ; then
    PATH="$PATH:$HOME/go/bin"
    PATH="$PATH:/usr/local/go/bin"
fi
if [ -e /usr/lib/go ]; then
    PATH="$PATH:$HOME/go/bin"
    PATH="$PATH:/usr/lib/go/bin"
fi

PATH="$HOME/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"
export PATH
