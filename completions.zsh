# Expand the last alias on space by default; to avoid expanding.
function expand_alias_space() {
    zle _expand_alias
    zle magic-space
}
zle -N expand_alias_space
bindkey -M main ' ' expand_alias_space

# Expand aliases on space by default. To avoid expanding, use Ctrl-Space.
# Expand the last alias on return by default; to avoid expanding, use Ctrl-Return.
function expand_alias_return() {
    zle _expand_alias
    zle accept-line
}
zle -N expand_alias_return
bindkey -M main '^M' expand_alias_return
bindkey -M main '^[[29~' accept-line

# Press tab twice to cycle through the completion menu
zstyle ':completion:*' menu select
#zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
# export ZSH_COMPLETION_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43:ma=44;37'
# zstyle ':completion:*' list-colors ${ZSH_COMPLETION_COLORS}
# setopt menu_complete

autoload -Uz compinit && compinit
