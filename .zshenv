if [[ -n $TMUX ]]; then
    return 0
fi

# dotfilesへのパスを定義
if [[ -z $DOTPATH ]]; then
    export DOTPATH="$HOME/dotfiles"
fi
# libs
source $DOTPATH/etc/lib/util.sh


export LANG=ja_JP.UTF-8


# 補完関数群
FPATH="/usr/local/share/zsh-completions:$FPATH"
FPATH="/opt/homebrew/share/zsh/site-functions:$FPATH"
FPATH="${HOME}/.zfunc:$FPATH"
FPATH="${HOME}/.local/share/zsh-completions:$FPATH"
export FPATH

# ls
if is_osx ; then
    export LSCOLORS='gxfxcxdxbxegedabagacad'
fi



# OpenSSL Path for Darwin
if type -a brew > /dev/null && brew --prefix openssl > /dev/null; then
    OPENSSL_ROOT_DIR=$(brew --prefix openssl)
    export OPENSSL_INCLUDE_DIR=$OPENSSL_ROOT_DIR/include
    export OPENSSL_LIB_DIR=$OPENSSL_ROOT_DIR/lib
    export DEP_OPENSSL_INCLUDE=$OPENSSL_ROOT_DIR/include

    # Ruby use Homebrew OpenSSL (note: will not work for ruby < 2.4)
    export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
fi


