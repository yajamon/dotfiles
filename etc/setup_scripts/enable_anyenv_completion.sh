readonly local ANYENV_ROOT=${HOME}/.anyenv
readonly local ANYENV_COMPLETIONS=${ANYENV_ROOT}/completions

if [ -e $ANYENV_ROOT ]; then
    if [ -f $ANYENV_COMPLETIONS/anyenv.zsh ]; then
        source $ANYENV_COMPLETIONS/anyenv.zsh
    fi

    for env in $(ls $HOME/.anyenv/envs/)
    do
        local COMPLETIONS="$ANYENV_ROOT/envs/$env/completions"
        if [ -f $COMPLETIONS/$env.zsh ]; then
            source $COMPLETIONS/$env.zsh
        elif [ -f $COMPLETIONS/_$env ]; then
            source $COMPLETIONS/"_$env"
        fi
    done
fi
