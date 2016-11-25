#!/bin/bash

DOTFILES_REPO="https://github.com/yajamon/dotfiles.git"
git clone --recursive $DOTFILES_REPO $HOME/dotfiles
./$HOME/.dotfiles/setup.sh
