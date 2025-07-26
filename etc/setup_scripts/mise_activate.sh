readonly local MISE_BIN=${HOME}/.local/bin/mise

if [ -e $MISE_BIN ]; then
    eval "$($MISE_BIN activate zsh)"
fi
