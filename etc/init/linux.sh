echo "linux only install script"

DOT_PATH=$HOME/dotfiles
INIT_SCRIPTS=$DOT_PATH/etc/init

if type -a yum >/dev/null 2>&1 ; then
    echo "Recommended: let's install tools" >&2
    echo "bash $INIT_SCRIPTS/yum.sh" >&2
fi

echo "Recommended: dein.vim" >&2
echo "bash $INIT_SCRIPTS/dein.vim.sh" >&2
