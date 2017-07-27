#!/bin/bash

DOTFILES_REPO="https://github.com/yajamon/dotfiles.git"
DOT_PATH=$HOME/dotfiles

git clone --recursive $DOTFILES_REPO $DOT_PATH
$DOT_PATH/setup.sh

source $DOT_PATH/etc/lib/util.sh
if is_osx; then
    $DOT_PATH/etc/init/osx.sh
else
    $DOT_PATH/etc/init/linux.sh
fi
