echo "linux only install script"

DOT_PATH=$HOME/dotfiles
INIT_SCRIPTS=$DOT_PATH/etc/init

if type -a yum >/dev/null 2>&1 ; then
    bash $INIT_SCRIPTS/yum.sh
fi

bash $INIT_SCRIPTS/dein.vim.sh
