function pdf --wraps "tdf" --description 'open pdf pages in terminal'
    set -l func_name (status current-function | string replace -ra '\s' '-')
    if not type -q tdf
      cargo install --git https://github.com/itsjunetime/tdf.git
    end

    # If not exist create autocompletion for command
    if not test -e ~/.config/fish/completions/$func_name.fish
        mkdir -p ~/.config/fish/completions
        printf '%s\n' \
            'complete -e -c '$func_name \
            'complete -c '$func_name' -f -a '\''(' \
            '  __fish_complete_directories;' \
            '  __fish_complete_suffix | grep ".pdf\$";' \
            ')'\' \
            > ~/.config/fish/completions/$func_name.fish
    end
    command tdf $argv
end

# You may check a commands autocompletion via: `complete "$command"`
# Tip: You may view command autocompletion results via: `complete -C "$command "`
# Tip: '--wraps' it will include wrapped command auto completion
