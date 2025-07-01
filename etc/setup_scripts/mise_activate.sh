readonly local MISE_BIN=${HOME}/.local/share/mise

if [ -e $MISE_BIN ]; then
    eval "$($MISE_BIN/mise activate zsh)"
fi
