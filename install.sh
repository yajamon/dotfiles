#!/bin/bash

DOTFILES_REPO="https://github.com/yajamon/dotfiles.git"
DOT_PATH=$HOME/dotfiles

if ! type -a git; then
    echo "REQUIRED COMMAND: git" >&2
    exit 1
fi

git clone --recursive $DOTFILES_REPO $DOT_PATH
$DOT_PATH/setup.sh

source $DOT_PATH/etc/lib/util.sh
if is_osx; then
    bash $DOT_PATH/etc/init/osx.sh
else
    bash $DOT_PATH/etc/init/linux.sh
fi
