# Reduce latency when pressing <Esc>
export KEYTIMEOUT=1

# Use emacs style commands inline
bindkey -e

# Use bash style Ctrl-W
my-backward-delete-word() {
    local WORDCHARS=${WORDCHARS/\//}
    zle backward-delete-word
}
zle -N my-backward-delete-word
bindkey '^W' my-backward-delete-word

# Use CTRL-J to edit the current command in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^j' edit-command-line

# Make cd push the old directory onto the directory stack (ignoring duplicates)
setopt auto_pushd
setopt pushd_ignore_dups

# Follow sym links
setopt chase_links

# Try to resolve spelling errors of commands
setopt correct

# Turn off beeps
unsetopt beep
