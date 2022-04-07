#!/usr/bin/zsh
function peco-src () {
    local selected_dir=$(ghq list | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        local repo=$(ghq list --full-path --exact $selected_dir)
        BUFFER="cd ${repo}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src

bindkey '^]' peco-src
