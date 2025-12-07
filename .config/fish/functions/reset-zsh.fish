function reset-zsh --wraps=' cp /etc/skel/.zshrc                   ~/.zshrc                           && echo "Restored zsh"' --description 'alias reset-zsh= cp /etc/skel/.zshrc                   ~/.zshrc                           && echo "Restored zsh"'
     cp /etc/skel/.zshrc                   ~/.zshrc                           && echo "Restored zsh" $argv
end
