function list-fonts --wraps='fc-list --format "%{family}\\n"' --description 'alias list-fonts=fc-list --format "%{family}\\n"'
    fc-list --format "%{family}\n" $argv
end
