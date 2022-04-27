#!/bin/bash

readonly DOT_PATH=$HOME/dotfiles
readonly DOT_FILES=($DOT_PATH/.??*)
readonly DOT_BINS=($DOT_PATH/bin/*)

for file in ${DOT_FILES[@]}
do
    file=$(basename $file)
    [[ $file == *.DS_Store ]] && continue
    [[ $file == .git ]] && continue
    [[ $file == .gitignore ]] && continue
    [[ $file == .gitmodules ]] && continue

    if [ -L $HOME/$file ] ; then
        echo "exists link: $HOME/$file" 1>&2
        [ "$(readlink $HOME/$file)" != "$DOT_PATH/$file" ] && {
            echo "but, look different location: $(readlink $HOME/$file)"
        } 1>&2
        continue
    fi
    [ -e $HOME/$file ] && echo "exists file: $HOME/$file" 1>&2 && continue

    ln -sv $DOT_PATH/$file $HOME/$file
done

if ! [ -e $HOME/bin ] ; then
    mkdir -v $HOME/bin
fi
if [ -L $HOME/bin ] ; then
    echo "$HOME/bin is symbolic link" 1>&2
    echo "abort" 1>&2
    exit 1
fi
if ! [ -d $HOME/bin ] ; then
    echo "$HOME/bin is not directry" 1>&2
    echo "abort" 1>&2
    exit 1
fi

for bin_item in ${DOT_BINS[@]}
do
    bin_item=$(basename $bin_item)
    src="$DOT_PATH/bin/$bin_item"
    dest="$HOME/bin/$bin_item"

    if [ -L $dest ] ; then
        echo "exists link: $dest" 1>&2
        [ "$(readlink $dest)" != "$src" ] && {
            echo "but, look different location: $(readlink $dest)"
        } 1>&2
        continue
    fi
    [ -e $dest ] && echo "exists file: $dest" 1>&2 && continue

    ln -sv $src $dest
done
