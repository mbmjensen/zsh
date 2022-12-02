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
alias oc='fuzzy-open-config-files'
alias ov='fuzzy-open-vim-files'
alias oz='fuzzy-open-zsh-files'
alias efd='edit-fd-ignore'

# Global
alias -g A='| awk'
alias -g E='| sed'
alias -g G='| grep'
alias -g H='| head'
alias -g L='| less -R'
alias -g N='> /dev/null'
alias -g R='| tr'
alias -g S='| sort'
alias -g T='| tail'
alias -g U='| gunzip'
alias -g V='| vim -'
alias -g Y='| tee'
alias -g Z='| gzip'

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
alias sz='source ${ZDOTDIR}/.zshenv && source ${ZDOTDIR}/.zshrc'

# Git
alias gb='git branch'
alias gc='git commit'
alias gca='git commit --all'
alias gcm='git commit --message'
alias gd='git diff'
alias gl='git log --pretty=oneline'
alias gp='git pull'
alias gpu='git push'
alias gr='cd $(git rev-parse --show-toplevel)'
alias gs='git status --ignore-submodules'
alias -g H1='HEAD~1'
alias -g H2='HEAD~2'
alias -g H3='HEAD~3'
alias -g H4='HEAD~4'
alias -g H5='HEAD~5'
alias -g H6='HEAD~6'
alias -g H7='HEAD~7'
alias -g H8='HEAD~8'
alias -g H9='HEAD~9'

# Tmux
alias t='tmux'
alias ta='tmux attach'
alias tas='tmux attach -t $(tmux list-sessions -F "#{session_name}" | fzf --reverse)'
alias tns='tmux new-session -s'
alias tks='tmux kill-session -t $(tmux list-sessions -F "#{session_name}" | fzf --reverse)'
alias tka='tmux kill-server'

# Homebrew
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
