#!/usr/bin/zsh
function peco-src () {
    local selected_dir=$(ghq list | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd $(ghq root)/${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src

bindkey '^]' peco-src
