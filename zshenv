#!/usr/bin/env zsh

# Look for all other zsh files in ZDOTDIR
export ZDOTDIR="${HOME}/.config/zsh/"

# Import Locations
export DRIVE="${HOME}/Drive/"

# Set default editor to VIM
export EDITOR="vim"
export VISUAL="${EDITOR}"

# Set up the file path for zsh
fpath+=("$ZDOTDIR/pure")
export fpath

# Set up the path variable
path+=("/usr/local/sbin")
export path
