#!/usr/bin/env zsh

# Line Editor Settings
bindkey -v

# Prompt Settings
autoload -U promptinit; promptinit
prompt pure

_set_cursor() {
    echo -ne '\e[5 q'       # Set the cursor to beam mode
}
precmd_functions+=(_set_cursor)
zle-keymap-select () {
    if [ "$TERM" = "xterm-256color" ]; then
        if [ $KEYMAP = vicmd ]; then
            # Set block cursor
            echo -ne '\e[1 q'
        else
            # Set beam cursor
            echo -ne '\e[5 q'
        fi
    fi

    if typeset -f prompt_pure_update_vim_prompt_widget > /dev/null; then
        # Refresh prompt and call Pure super function
        prompt_pure_update_vim_prompt_widget
    fi
}

# Bind the callback
zle -N zle-keymap-select

# Reduce latency when pressing <Esc>
export KEYTIMEOUT=1

# Completion Settings
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
zstyle ':completion:*' menu select
export ZSH_COMPLETION_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43:ma=44;37'
zstyle ':completion:*' list-colors ${ZSH_COMPLETION_COLORS}
setopt menu_complete
autoload -Uz compinit && compinit

# General Options
setopt chase_links  # Follow sym links
setopt correct      # Try to resolve spelling errors of commands
unsetopt beep       # Turn off beeps

# Aliases
alias ..='cd ..'
alias ...='cd ...'
alias ....='cd ....'
alias .....='cd .....'
alias ez='vim -o ${ZDOTDIR}/.zshrc ${ZDOTDIR}/zshenv'
alias sz='source ${ZDOTDIR}/zshenv && source ${ZDOTDIR}/.zshrc '
alias -g L='| less'
alias cl='clear'
alias cls='clear && ls'
alias config='cd ~/.config && ls'
alias rmf='rm -rf'

## Git Configuration
alias gc='git commit'
alias gca='git commit --all'
alias gcm='git commit --message'
alias gp='git push'
alias gs='git status'

## ls Configuration
alias ls='ls -G'

source "${ZDOTDIR}/.zshrc_local"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source "${ZDOTDIR}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
