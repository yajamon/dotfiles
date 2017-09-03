echo "osx only install script"

DOT_PATH=$HOME/dotfiles
INIT_SCRIPTS=$DOT_PATH/etc/init

if ! type -a brew; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [ ! -e /usr/local/bin/zsh ]; then
    brew install --without-etcdir zsh
    brew install zsh-completions
    chsh -s /usr/local/bin/zsh
fi

bash $INIT_SCRIPTS/dein.vim.sh
