# Use fd and respect .gitignore by default
export FZF_DEFAULT_COMMAND='fd --type f --type d --hidden --follow --exclude .git'

# Fix the colors that fzf uses to match colorscheme
export FZF_DEFAULT_OPTS='
 --color=fg:#5C6773,bg:#FAFAFA,hl:#ABB0B6
 --color=bg+:#F3F3F3,hl+:#FF7733
 --color=info:#E6B673,prompt:#FF7733,pointer:#FF7733
 --color=marker:#E7C547,spinner:#FF7733,header:#ABB0B6'

# Use the same default command for Ctrl-T
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Setup
if [[ ! "$PATH" == */usr/local/Cellar/fzf/0.23.0/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/Cellar/fzf/0.23.0/bin"
fi

# Initialize auto-completion
[[ $- == *i* ]] && source "/usr/local/Cellar/fzf/0.23.0/shell/completion.zsh" 2> /dev/null

# Initialize key bindings
source "/usr/local/Cellar/fzf/0.23.0/shell/key-bindings.zsh"
[[ -f $XDG_CONFIG_HOME/fzf/fzf.zsh ]] && source $XDG_CONFIG_HOME/fzf/fzf.zsh

