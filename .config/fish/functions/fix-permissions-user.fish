function fix-permissions-user --wraps='sudo chown -R activ:activ ~/.config ~/.local' --description 'alias fix-permissions-user=sudo chown -R activ:activ ~/.config ~/.local'
    sudo chown -R activ:activ ~/.config ~/.local $argv
end
