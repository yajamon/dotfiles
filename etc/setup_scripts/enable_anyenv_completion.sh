if [ -e $HOME/.anyenv ]; then
    if [ -f $HOME/.anyenv/completions/anyenv.zsh ]; then
        source $HOME/.anyenv/completions/anyenv.zsh
    fi

    for p in $(ls $HOME/.anyenv/envs/*/completions/*.zsh)
    do
        source $p
    done
fi
