#!/bin/zsh

autoload -U promptinit; promptinit
prompt pure

# Options
setopt no_beep      # Turn off beeps
setopt auto_cd      # Change directories using only the dir name

unsetopt menu_complete      # Turn off traditional autocomplete menu
setopt auto_menu    # On two TABS cycle through the menu of options

# Source Plugins
source ${FZFDIR}/shell/key-bindings.zsh
source ${FZFDIR}/shell/completion.zsh

# Aliases
alias lsa='ls -a'
alias lsla='ls -la'
alias ezrc='vim $ZDOTDIR/.zshrc'
alias szrc='source $ZDOTDIR/.zshrc'
alias ezenv='vim $ZDOTDIR/.zshenv'
alias szenv='source $ZDOTDIR/.zshenv'
alias sz='source $ZDOTDIR/.zshrc && source $ZDOTDIR/.zshenv'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
