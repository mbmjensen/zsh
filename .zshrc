#!/usr/bin/env zsh

# Local Settings
local_overrides=$ZDOTDIR/.zshrc.local

# Prompt Settings
autoload -U promptinit; promptinit
prompt pure

# Cursor Configuration
set_cursor() {
    echo -ne '\e[5 q'       # Set the cursor to beam mode
}
precmd_functions+=(set_cursor)

# Reduce latency when pressing <Esc>
export KEYTIMEOUT=1

# Use emacs style commands inline. On escape, edit the current command in
# $EDITOR
bindkey -e
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^ ' edit-command-line

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
alias ez='vim -o ${ZDOTDIR}/.zshrc ${ZDOTDIR}/.zshenv'
alias sz='source ${ZDOTDIR}/.zshenv && source ${ZDOTDIR}/.zshrc'
alias -g L='| less'
alias cl='clear'
alias cls='clear && ls'
alias config='cd ~/.config && ls'
alias rmf='rm -rf'

## Git Configuration
alias gc='git commit'
alias gca='git commit --all'
alias gcm='git commit --message'
alias gl='git log --pretty=oneline'
alias gp='git pull'
alias gpu='git push'
alias gs='git status'

## ls Configuration
alias ls='ls -G'

## Configure FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### FZF uses fd and respects .gitignore by default
FZF_DEFAULT_COMMAND='fd --type f --type d --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

alias cdf='cd $(fd --type directory d --hidden --exclude .git | fzf)'

# Enable Zsh Syntax Highlighting
source "$ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Enable pyenv. This is needed for pyenv shims to work properly.
eval "$(pyenv init -)"

# Apply Local zshrc Settings
[[ -f "$local_overrides" ]] && source "$local_overrides"

# Chrome Utilities

## Search chrome history with fzf
ch() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  cp -f ~/Library/Application\ Support/Google/Chrome/Default/History /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}

# Quick-launch applications

alias g="open 'https://gmail.com'"
alias y="open 'https://youtube.com'"
alias s="open -a spotify"
alias i="open -a safari"
alias c="open -a 'Google Chrome'"
alias l="open -a reminders"
