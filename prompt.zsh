autoload -U promptinit; promptinit
prompt pure

# Cursor Configuration
set_cursor() {
    echo -ne '\e[5 q'       # Set the cursor to beam mode
}
precmd_functions+=(set_cursor)

