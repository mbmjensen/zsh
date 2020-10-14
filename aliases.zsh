# Quick-launch applications
alias g="open 'https://gmail.com'"
alias y="open 'https://youtube.com'"
alias s="open -a spotify"
alias i="open -a safari"
alias c="open -a 'Google Chrome'"
alias l="open -a reminders"

# Global
alias -g L='| less'

# Navigation
alias ..='cd ..'
alias ...='cd ...'
alias ....='cd ....'
alias .....='cd .....'
alias cl='clear'
alias cls='clear && ls'
alias config='cd ~/.config && ls'
alias rmf='rm -rf'

# Misc
alias ez='vim -o ${ZDOTDIR}/.zshrc ${ZDOTDIR}/.zshenv'
alias sz='source ${ZDOTDIR}/.zshenv && source ${ZDOTDIR}/.zshrc'

# Application-Specific
### Git
alias gc='git commit'
alias gca='git commit --all'
alias gcm='git commit --message'
alias gl='git log --pretty=oneline'
alias gp='git pull'
alias gpu='git push'
alias gs='git status'

## ls
alias ls='ls -G'