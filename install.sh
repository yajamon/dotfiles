#!/bin/bash

DOTFILES_REPO="https://github.com/yajamon/dotfiles.git"
DOT_PATH=$HOME/dotfiles

git clone --recursive $DOTFILES_REPO $DOT_PATH
$DOT_PATH/setup.sh
