#!/bin/bash
if ! type -a curl 1>/dev/null 2>&1; then
    echo "Required curl" >&2
    exit 1
fi

tmpInstaller=$(mktemp)
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $tmpInstaller
sh $tmpInstaller $HOME/.vim/bundles
rm $tmpInstaller
