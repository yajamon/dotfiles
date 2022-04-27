#!/bin/bash

readonly DOT_PATH=$HOME/dotfiles
readonly DOT_FILES=($DOT_PATH/.??*)
readonly DOT_BINS=($DOT_PATH/bin/*)
readonly DOT_CONFIG=($DOT_PATH/.config/*)

for file in ${DOT_FILES[@]}
do
    file=$(basename $file)
    [[ $file == *.DS_Store ]] && continue
    [[ $file == .git ]] && continue
    [[ $file == .gitignore ]] && continue
    [[ $file == .gitmodules ]] && continue
    [[ $file == .config ]] && continue

    src="$DOT_PATH/$file"
    dest="$HOME/$file"
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


if ! [ -e $HOME/.config ] ; then
    mkdir -v $HOME/.config
fi
if ! [ -d $HOME/.config ] ; then
    echo "$HOME/.config is not directry" 1>&2
    echo "abort" 1>&2
    exit 1
fi
for config in ${DOT_CONFIG[@]}
do
    config=$(basename $config)
    src="$DOT_PATH/.config/$config"
    dest="$HOME/.config/$config"

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
