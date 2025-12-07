function reset-fish --wraps='cp /etc/skel/.config/fish/config.fish ~/.config/fish/config.fish         && echo "Restored fish"' --description 'alias reset-fish=cp /etc/skel/.config/fish/config.fish ~/.config/fish/config.fish         && echo "Restored fish"'
    cp /etc/skel/.config/fish/config.fish ~/.config/fish/config.fish         && echo "Restored fish" $argv
end
