#!/usr/bin/env zsh

# Zsh Configuration
export ZDOTDIR="$HOME/.config/zsh"
export EDITOR="vim"
export VISUAL="$EDITOR"
local_overrides="$ZDOTDIR/zshenv.local"

# User Directories
export DRIVE_DIR="$HOME/Drive"

# Development Directories
export DEV_DIR="$HOME/Development"
export LOGS_DIR="$DEV_DIR/Logs"
export CONFIG_DIR="$HOME/.config"
export XDG_CONFIG_HOME="$CONFIG_DIR"
export USER_BIN_DIR="$DEV_DIR/bin"
export LOCAL_USER_BIN_DIR="${USER_BIN_DIR}/local"

# Go Configuration
export GOPATH="$DEV_DIR/go"
export GOBIN="$GOPATH/bin"

# Set up the file path for zsh
fpath+=(
    "$ZDOTDIR/pure"
    "$ZDOTDIR/zsh-completions/src"
)
export fpath

# Set up the path variable
path+=(
    "$USER_BIN_DIR"
    "$LOCAL_USER_BIN_DIR"
    "$GOBIN"
)
export path

[[ -f "$local_overrides" ]] && source "$local_overrides"
