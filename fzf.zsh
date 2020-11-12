# Fix the colors that fzf uses to match colorscheme
fzf_colors='
  --color=fg:#9c9c9b,bg:#eeeeed,hl:#d75e00
  --color=fg+:#4c4c4b,gutter:#eeeeed,bg+:#e4e4e4,hl+:#d75e00
  --color=info:#9c9c9b,prompt:#8959a8,pointer:#d6225e
  --color=marker:#4271ad,spinner:#4271ad,header:#4271ad'

export FZF_DEFAULT_OPTS=$fzf_colors
export FZF_DEFAULT_COMMAND='fd --type d --type f --hidden --exclude .git'

# Use the same default command for Ctrl-T
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Use CTRL-N to complete files
my_fzf_file_widget() {
    LBUFFER=${LBUFFER}$(fd --type f --hidden --follow --exclude .git | fzf \
        --height 40% \
        --layout=reverse \
        --bind 'ctrl-r:reload(fd . / --type f --hidden --follow --exclude .git)' \
        --bind 'ctrl-h:reload(fd . $HOME --type f --hidden --follow --exclude .git)')
    local result=$?
    if [[ $result == 0 ]]; then
        zle magic-space
    fi
    zle reset-prompt
    return $result
}
zle -N my_fzf_file_widget
bindkey '^n' my_fzf_file_widget

# Use CTRL-P to complete files
my_fzf_dir_widget() {
    LBUFFER=${LBUFFER}$(fd --type d --hidden --follow --exclude .git | fzf \
        --height 40% \
        --layout=reverse \
        --bind 'ctrl-r:reload(fd . / --type d --hidden --follow --exclude .git)' \
        --bind 'ctrl-h:reload(fd . $HOME --type d --hidden --follow --exclude .git)')
    local result=$?
    if [[ $result == 0 ]]; then
        zle magic-space
    fi
    zle reset-prompt
    return $result
}
zle -N my_fzf_dir_widget
bindkey '^p' my_fzf_dir_widget

# Setup
if [[ ! "$PATH" == */usr/local/Cellar/fzf/0.23.1/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/Cellar/fzf/0.23.1/bin"
fi

# Initialize auto-completion
[[ $- == *i* ]] && source "/usr/local/Cellar/fzf/0.23.1/shell/completion.zsh" 2> /dev/null

# Initialize key bindings
source "/usr/local/Cellar/fzf/0.23.1/shell/key-bindings.zsh"
