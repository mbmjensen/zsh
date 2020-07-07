# ZSH Configuration

My personal zsh settings and configurations.

## Customizing zshenv and zshrc

Some settings in the zshenv and zshrc are workspace specific. Other settings
can contain work-specific settings that I do not want to track in version
control. To keep these settings separate, put them in the `.zshrc.local` and
`.zshenv.local` files. These local files are ignored in the gitignore but are
still sourced, if they exist in the `.zshrc` and `zshenv`, respectively.
