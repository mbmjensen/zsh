#!/usr/bin/env zsh

sections=(
    "$ZDOTDIR/options.zsh"
    "$ZDOTDIR/completions.zsh"
    "$ZDOTDIR/prompt.zsh"
    "$ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    "$ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
    "$ZDOTDIR/aliases.zsh"
    "$ZDOTDIR/app_configs.zsh"
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

    # Apply local overrides, if it exists. The local override should not be
    # stored tracked on github.
    override_section="${section:s/.zsh/.local.zsh/}"
    [[ -f $override_section ]] && source $override_section
done

# Print file load time
execution_time
