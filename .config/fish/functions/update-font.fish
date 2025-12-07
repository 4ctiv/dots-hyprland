function update-font --wraps='sudo fc-cache -fv' --description 'alias update-font=sudo fc-cache -fv'
    sudo fc-cache -fv $argv
end
