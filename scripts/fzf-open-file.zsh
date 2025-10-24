fzf-open-file() {
    local selected=$(fd --type f --hidden --no-ignore-vcs . ~ | fzf)
    if [[ -n "$selected" ]]; then
        $EDITOR "$selected"
    fi

    zle reset-prompt
}

zle -N fzf-open-file
bindkey "^f" fzf-open-file
