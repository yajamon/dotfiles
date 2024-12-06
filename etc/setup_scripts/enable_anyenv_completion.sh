if [ -e $HOME/.anyenv ]; then
    if [ -f $HOME/.anyenv/completions/anyenv.zsh ]; then
        source $HOME/.anyenv/completions/anyenv.zsh
    fi

    for env in $(ls $HOME/.anyenv/envs/)
    do
        source $HOME/.anyenv/envs/$env/completions/"_$env"
    done
fi
