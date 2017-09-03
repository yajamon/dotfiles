echo "osx only install script"

DOT_PATH=$HOME/dotfiles
INIT_SCRIPTS=$DOT_PATH/etc/init

if ! type -a brew; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
bash $INIT_SCRIPTS/dein.vim.sh
