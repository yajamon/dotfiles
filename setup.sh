#!/bin/bash

DOT_PATH=$HOME/dotfiles
DOT_FILES=($DOT_PATH/.??* bin)

for file in ${DOT_FILES[@]}
do
    file=$(basename $file)
    [[ $file == *.DS_Store ]] && continue
    [[ $file == .git ]] && continue
    [[ $file == .gitignore ]] && continue

    if [ -L $HOME/$file ] ; then
        [ "$(readlink $HOME/$file)" = "$DOT_PATH/$file" ] && echo "exists link: $HOME/$file"
        [ "$(readlink $HOME/$file)" != "$DOT_PATH/$file" ] && {
            echo "exists link: $HOME/$file"
            echo "but, look different location: $(readlink $HOME/$file)"
        } 1>&2
        continue
    fi
    [ -e $HOME/$file ] && echo "exists file: $HOME/$file" 1>&2 && continue

    ln -sv $DOT_PATH/$file $HOME/$file
done
