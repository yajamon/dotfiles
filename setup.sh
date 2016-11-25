#!/bin/bash

DOT_PATH=$(cd $(dirname $0) && pwd)
DOT_FILES=($DOT_PATH/.??* bin)

for file in ${DOT_FILES[@]}
do
    file=$(basename $file)
    [[ $file == *.DS_Store ]] && continue
    [[ $file == .git ]] && continue
    [[ $file == .gitignore ]] && continue

    [ -e $HOME/$file ] && continue

    ln -s $DOT_PATH/$file $HOME/$file
done
