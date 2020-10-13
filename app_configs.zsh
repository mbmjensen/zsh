### fzf

# Use fd and respect .gitignore by default
export FZF_DEFAULT_COMMAND='fd --type f --type d --hidden --follow --exclude .git'

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

### pyenv

# This is needed for pyenv shims to work properly.
eval "$(pyenv init -)"

### zsh-completions

# Possibly necessary according to the plugin README
rm -f ~/.zcompdump; compinit
