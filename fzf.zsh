# Fix the colors that fzf uses to match colorscheme
fzf_colors='
  --color=fg:#9c9c9b,bg:-1,hl:#d75e00
  --color=fg+:#4c4c4b,gutter:-1,bg+:-1,hl+:#d75e00
  --color=info:#9c9c9b,prompt:#8959a8,pointer:#d6225e
  --color=marker:#4271ad,spinner:#4271ad,header:#4271ad'

export FZF_DEFAULT_OPTS=$fzf_colors
export FZF_DEFAULT_COMMAND='fd --type d --type f --hidden --exclude .git'

# Use the same default command for Ctrl-T
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Get the word under the cursor
get-word-under-cursor() {
    local buffer=$1

    local i=0
    local beginword=0
    local words=("${(z)BUFFER}")

    while (( beginword <= CURSOR )); do
        (( i++ ))
        (( beginword += ${#words[$i]}+1 ))
    done

    echo "$words[$i]"
}
# Use CTRL-X Ctrl-F to complete files
my_fzf_file_widget() {
    LBUFFER=${LBUFFER}$(fd --type f --hidden --follow --exclude .git | fzf \
        --query=$( get-word-under-cursor $BUFFER ) \
        --height 40% \
        --layout=reverse \
        --bind 'ctrl-j:reload(fd . / --type f --hidden --follow --exclude .git)' \
        --bind 'ctrl-k:reload(fd . $HOME --type f --hidden --follow --exclude .git)')
    local result=$?
    if [[ $result == 0 ]]; then
        zle magic-space
    fi
    zle reset-prompt
    return $result
}
zle -N my_fzf_file_widget
bindkey '^x^f' my_fzf_file_widget

# Use CTRL-X Ctrl-D to complete directories
my_fzf_dir_widget() {
    LBUFFER=${LBUFFER}$(fd --type d --hidden --follow --exclude .git | fzf \
        --query=$( get-word-under-cursor $BUFFER ) \
        --height 40% \
        --layout=reverse \
        --bind 'ctrl-j:reload(fd . / --type d --hidden --follow --exclude .git)' \
        --bind 'ctrl-k:reload(fd . $HOME --type d --hidden --follow --exclude .git)')
    local result=$?
    if [[ $result == 0 ]]; then
        zle magic-space
    fi
    zle reset-prompt
    return $result
}
zle -N my_fzf_dir_widget
bindkey '^x^d' my_fzf_dir_widget

# Setup
if [[ ! "$PATH" == */usr/local/Cellar/fzf/0.23.1/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/Cellar/fzf/0.23.1/bin"
fi

# Initialize auto-completion
[[ $- == *i* ]] && source "$DEV_DIR/fzf/shell/completion.zsh" 2> /dev/null

# Initialize key bindings
source "$DEV_DIR/fzf/shell/key-bindings.zsh"
