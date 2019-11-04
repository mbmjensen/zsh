autoload -U promptinit; promptinit
prompt pure

# Options
setopt no_beep      # Turn off beeps
setopt auto_cd      # Change directories using only the dir name

unsetopt menu_complete      # Turn off traditional autocomplete menu
setopt auto_menu    # On two TABS cycle through the menu of options

# Aliases
alias lsa='ls -a'
alias zshrc='vim $ZDOTDIR/.zshrc'
alias szshrc='source $ZDOTDIR/.zshrc'
alias zshenv='vim $ZDOTDIR/.zshenv'
alias szshenv='source $ZDOTDIR/.zshenv'
