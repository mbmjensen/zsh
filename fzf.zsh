# Use fd and respect .gitignore by default
export FZF_DEFAULT_COMMAND='fd --type f --type d --hidden --follow --exclude .git'

# Fix the colors that fzf uses to match colorscheme
export FZF_COLORS='
  --color=fg:#9c9c9b,bg:#eeeeed,hl:#d75e00
  --color=fg+:#4c4c4b,gutter:#eeeeed,bg+:#e4e4e4,hl+:#d75e00
  --color=info:#9c9c9b,prompt:#8959a8,pointer:#d6225e
  --color=marker:#4271ad,spinner:#4271ad,header:#4271ad'

export FZF_DEFAULT_OPTS=$FZF_COLORS

# Use the same default command for Ctrl-T
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Setup
if [[ ! "$PATH" == */usr/local/Cellar/fzf/0.23.1/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/Cellar/fzf/0.23.1/bin"
fi

# Initialize auto-completion
[[ $- == *i* ]] && source "/usr/local/Cellar/fzf/0.23.1/shell/completion.zsh" 2> /dev/null

# Initialize key bindings
source "/usr/local/Cellar/fzf/0.23.1/shell/key-bindings.zsh"
