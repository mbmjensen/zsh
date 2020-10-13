# Reduce latency when pressing <Esc>
export KEYTIMEOUT=1

# Use emacs style commands inline.
bindkey -e

# On escape, edit the current command in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^ ' edit-command-line

# Follow sym links
setopt chase_links

# Try to resolve spelling errors of commands
setopt correct

# Turn off beeps
unsetopt beep
