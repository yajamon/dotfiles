#!/bin/bash


DOT_FILES=($HOME/dotfiles/.??* bin)

for file in ${DOT_FILES[@]}
do
    file=$(basename $file)
    [[ $file == *.DS_Store ]] && continue
    [[ $file == .git ]] && continue
    [[ $file == .gitignore ]] && continue

    ln -s $HOME/dotfiles/$file $HOME/$file
done
