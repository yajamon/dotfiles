# dotfilesへのパスを定義
if [[ -z $DOTPATH ]]; then
    _get_dotpath() {
        local d

        # 編集子(modifiers)という
        # :A フルパスにする。シンボリックリンクを解決して実際のパスにする。
        # :h ディレクトリ名の部分だけを残す
        d="${0:A:h}"

        // [[ $a =~ reqexp ]] 正規表現比較
        if [[ $d =~ dotfiles$ ]]; then
            echo "$d"
        else
            return 1
        fi
    }
    export DOTPATH="$(_get_dotpath)"
    unfunction _get_dotpath
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
