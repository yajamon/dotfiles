#!/bin/bash

readonly DOT_PATH="$HOME/dotfiles"
cd $DOT_PATH && git checkout -q master && git pull -q
cd $DOT_PATH && $DOT_PATH/setup.sh > /dev/null 2>&1
