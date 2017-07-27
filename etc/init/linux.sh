echo "linux only install script"

DOT_PATH=$HOME/dotfiles
INIT_SCRIPTS=$DOT_PATH/etc/init

if type -a yum >/dev/null 2>&1 ; then
    $INIT_SCRIPTS/yum.sh
fi

$INIT_SCRIPTS/dein.vim.sh
