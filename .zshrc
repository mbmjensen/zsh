#!/usr/bin/env zsh

sections=(
    "$ZDOTDIR/options.zsh"
    "$ZDOTDIR/completions.zsh"
    "$ZDOTDIR/prompt.zsh"

    # Configure plugins and programs
    "$ZDOTDIR/fzf.zsh"
    "$ZDOTDIR/fzf-tab.zsh"
    "$ZDOTDIR/pyenv.zsh"

    # Initialize plugins
    "$ZDOTDIR/fzf-tab/fzf-tab.plugin.zsh"
    "$ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    "$ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh"

    "$ZDOTDIR/aliases.zsh"
    "$ZDOTDIR/functions.zsh"
)

# Time zsh file load time
integer start_time=$(date '+%s')
execution_time () {
    end_time=$(date '+%s')
    time_elapsed=$(( end_time - start_time ))
    echo "Start Time: $time_elapsed"
}

# Source each section
for section in ${sections}; do
    [[ $section ]] && source $section

    # Apply local overrides, if it exists. The local override will not be
    # tracked on github.
    override_section="${section:s/.zsh/.local.zsh/}"
    [[ -f $override_section ]] && source $override_section
done

# Print file load time
execution_time
