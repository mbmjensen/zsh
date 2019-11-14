#!/bin/env zsh

export ZDOTDIR="${HOME}/Drive/Software/config/zsh/"
export DRIVE="${HOME}/Drive/"                           # Cloud Storage Dir
export EDITOR="vim"
export VISUAL="${EDITOR}"
fpath+=("$ZDOTDIR/pure")
path+=("/usr/local/sbin")
export fpath
export path
