# Quick-launch applications
alias e="open 'https://gmail.com'"
alias y="open 'https://youtube.com'"
alias s="open -a spotify"
alias i="open -a safari"
alias c="open -a 'Google Chrome'"
alias l="open -a reminders"

# Binary Script Shortcuts
alias ce='create-executable-script'
alias ob='fuzzy-open-bin-files'
alias ov='fuzzy-open-vim-files'
alias oz='fuzzy-open-zsh-files'
alias efd='edit-fd-ignore'

# Global
alias -g L='| less -R'

# Navigation
alias ..='cd ..'
alias ...='cd ...'
alias ....='cd ....'
alias .....='cd .....'
alias cl='clear'
alias cls='clear && ls'
alias config='cd ~/.config && ls'

# Directory
alias rmf='rm -rf'
alias mkdirp='mkdir -p'

# Misc
alias ez='vim -o ${ZDOTDIR}/.zshrc ${ZDOTDIR}/.zshenv'
alias sz='source ${ZDOTDIR}/.zshenv && source ${ZDOTDIR}/.zshrc'

# Application-Specific
### Git
alias gb='git branch'
alias gc='git commit'
alias gca='git commit --all'
alias gcm='git commit --message'
alias gd='git diff'
alias gl='git log --pretty=oneline'
alias gp='git pull'
alias gpu='git push'
alias gr='cd $(git rev-parse --show-toplevel)'
alias gs='git status'

### Googler
alias g="googler -n 5"
