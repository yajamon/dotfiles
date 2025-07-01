#!/bin/bash

COMPLETIONS="$HOME/.local/share/zsh-completions"

if [ ! -d "$COMPLETIONS" ]; then
    mkdir -p "$COMPLETIONS"
fi

if type -a rustup &>/dev/null; then
    rustup completions zsh > "$COMPLETIONS/_rustup"
    rustup completions zsh cargo > "$COMPLETIONS/_cargo"
fi

if type -a deno &>/dev/null; then
    deno completions zsh > "$COMPLETIONS/_deno"
fi

if type -a mise &>/dev/null; then
    mise completions zsh > "$COMPLETIONS/_mise"
fi
