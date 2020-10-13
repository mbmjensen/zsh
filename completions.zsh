zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
zstyle ':completion:*' menu select
export ZSH_COMPLETION_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43:ma=44;37'
zstyle ':completion:*' list-colors ${ZSH_COMPLETION_COLORS}
setopt menu_complete

# General Options
setopt chase_links  # Follow sym links
setopt correct      # Try to resolve spelling errors of commands
unsetopt beep       # Turn off beeps

autoload -Uz compinit && compinit
