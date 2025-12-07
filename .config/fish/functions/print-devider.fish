function print-devider --wraps="printf '%*s\\n' (tput cols) '' | tr ' '" --description "alias print-devider=printf '%*s\\n' (tput cols) '' | tr ' '"
    printf '%*s\n' (tput cols) '' | tr ' ' $argv
end
