if status is-interactive
    source ~/.profile

    ########################
    ###     Paths      ###
    ########################
    # export PATH="$PATH:/usr/local/go/bin"

    ########################
    ###     Theming      ###
    ########################
    # fish_config theme choose "Rosé\ Pine"
    # set fish_color_... "0xfffffff"

    ##########################
    ### (Typo) redirection ###
    ##########################
    # better defaults
    alias wget="wget -c"
    # common typo redirection
    alias cd..='cd ..'
    alias claer="clear"
    # windows command redirection
    alias dir="ls"
    alias taskmgr="htop"
    alias ipconfig="ip a"
    alias diskmgmt="sudo cfdisk"
    # linux   command redirection
    alias cp-recursive="rsync -ah --no-inc-recursive --info=progress2"
    alias yay="paru"
    alias nano="vim"
    alias gtop="btop"
    alias podman="docker"
    alias neofetch="fastfetch -l .config/neofetch/great-wave-transparent-2.png --logo-height 20"
    alias gksudo="pkexec"

    ##########################
    ### Beautify commands  ###
    ##########################
    # Colorize (will break grep due to color escape characters)
    alias ip="ip -c"
    alias ls='ls --color=auto'
    alias pacman='sudo pacman --color auto'
    alias grep='  grep --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias highlight='grep -A100'
    # Human readable format
    alias df="df -h"
    alias free="free -mt"
    alias lsblk="lsblk -fs"

end # End of interactive prompt config
