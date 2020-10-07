#!/usr/bin/env zsh

# Zsh Configuration
export ZDOTDIR="$HOME/.config/zsh/"
export EDITOR="vim"
export VISUAL="$EDITOR"
local_overrides="$ZDOTDIR/zshenv.local"

# User Directories
export DRIVE_DIR="$HOME/Drive"
export LOGS_DIR="$HOME/Documents/Logs"

# Development Directories
export DEV_DIR="$HOME/Development"
export CONFIG_DIR="$HOME/.config"
export USER_BIN_DIR="$DEV_DIR/bin"
export LOCAL_USER_BIN_DIR="${USER_BIN_DIR}/local"

# Go Configuration
export GOPATH="$DEV_DIR/go"
export GOBIN="$GOPATH/bin"

# FZF Settings
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Set up the file path for zsh
fpath+=(
    "$ZDOTDIR/pure"
    "$ZDOTDIR/zsh-completions/src"
)
export fpath

# Set up the path variable
path+=(
    "/usr/local/sbin"
    "$USER_BIN_DIR"
    "$LOCAL_USER_BIN_DIR"
    "$GOBIN"
)
export path

[[ -f "$local_overrides" ]] && source "$local_overrides"
