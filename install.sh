#!/bin/bash

DOTFILES_REPO="https://github.com/yajamon/dotfiles.git"
DOT_PATH=$HOME/dotfiles

if ! type -a git; then
    if type -a yum; then
        sudo yum install -y git
    fi
fi

git clone --recursive $DOTFILES_REPO $DOT_PATH
$DOT_PATH/setup.sh

source $DOT_PATH/etc/lib/util.sh
if is_osx; then
    bash $DOT_PATH/etc/init/osx.sh
else
    bash $DOT_PATH/etc/init/linux.sh
fi
