#!/bin/bash

DOT_PATH=$(cd $(dirname $0) && pwd)
DOT_FILES=($DOT_PATH/.??* bin)

for file in ${DOT_FILES[@]}
do
    file=$(basename $file)
    [[ $file == *.DS_Store ]] && continue
    [[ $file == .git ]] && continue
    [[ $file == .gitignore ]] && continue

    if [ -L $HOME/$file ] ; then
        [ "$(readlink $HOME/$file)" = "$DOT_PATH/$file" ] && echo "exists link: $HOME/$file" && continue
        [ "$(readlink $HOME/$file)" != "$DOT_PATH/$file" ] && echo "exists link: $HOME/$file" && echo "but, look different location: $(readlink $HOME/$file)" && continue
    fi
    [ -e $HOME/$file ] && echo "exists file: $HOME/$file" && continue

    ln -sv $DOT_PATH/$file $HOME/$file
done
