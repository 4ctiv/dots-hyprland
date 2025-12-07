function list-session-wayland --wraps='ls /usr/share/wayland-sessions' --description 'alias list-session-wayland=ls /usr/share/wayland-sessions'
    ls /usr/share/wayland-sessions $argv
end
