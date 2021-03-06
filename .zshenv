#!/usr/bin/env zsh

# Zsh Configuration
export ZDOTDIR="$HOME/.config/zsh"
export EDITOR="vim"
export VISUAL="$EDITOR"
export HISTFILE="$ZDOTDIR"

# User Directories
export DRIVE_DIR="$HOME/Drive"

# Development Directories
export XDG_CONFIG_HOME="$HOME/.config"
export DEV_DIR="$HOME/Development"
export LOGS_DIR="$DEV_DIR/Logs"
export USER_BIN_DIR="$DEV_DIR/bin"
export LOCAL_USER_BIN_DIR="${USER_BIN_DIR}/local"

# Go Configuration
export GOPATH="$DEV_DIR/go"
export GOBIN="$GOPATH/bin"

# Keep only the first occurence of each duplicated value to the fpath
# http://zsh.sourceforge.net/Doc/Release/Shell-Builtin-Commands.html
typeset -U FPATH fpath
fpath+=(
    "$ZDOTDIR/functions"
    "$ZDOTDIR/pure"
    "$ZDOTDIR/zsh-completions/src"
)
export fpath

# Keep only the first occurence of each duplicated value to the path
# http://zsh.sourceforge.net/Doc/Release/Shell-Builtin-Commands.html
typeset -U PATH path
path+=(
    "$DEV_DIR/fzf/bin"
    "$USER_BIN_DIR"
    "$LOCAL_USER_BIN_DIR"
    "$GOBIN"
)
export path
