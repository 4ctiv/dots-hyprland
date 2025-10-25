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
    # common typo redirection
    alias cd..='cd ..'
    alias claer="clear"
    # windows command redirection
    alias dir="ls"
    alias taskmgr="htop"
    alias ipconfig="ip a"
    alias diskmgmt="sudo cfdisk"
    # linux   command redirection
    alias nano="vim"
    alias gtop="btop"
    alias podman="docker"
    alias neofetch="fastfetch -l .config/neofetch/great-wave-transparent-2.png --logo-height 20"

    #################################################
    ### Aliases for Input & Basic system settings ###
    #################################################
    # font
    alias update-font='sudo fc-cache -fv'
    # keyboard & language
    alias set-keyboard-de="sudo localectl set-x11-keymap de"
    alias set-keyboard-us="sudo localectl set-x11-keymap us"
    alias set-locale-de="sudo localectl set-locale LANG=de_DE.UTF-8"
    alias set-locale-us="sudo localectl set-locale LANG=en_US.UTF-8"
    # systemd
    alias hibernation-enable="sudo systemctl unmask hibernate.target"
    alias hibernation-disable="sudo systemctl mask hibernate.target"
    alias update-systemctl="sudo sysctl --system"
    # grub
    alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
    alias grub-install-efi-tpm="sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --modules='tpm' --disable-shim-lock"

    ###########################
    ### Software Management ###
    ###########################
    # should be defaults (in ineractive mode)
    alias wget="wget -c"
    alias process-tree="ps auxf"
    # debugging commands
    alias check-coredump="coredumpctl gdb"
    alias check-file-hex-ascii="hexdump -C"
    # yt-dpl (youtube)
    alias yt-audio="yt-dlp --extract-audio --audio-format best "
    alias yt-video="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "
    # web
    alias web-app="brave --app"
    alias unhblock="hblock -S none -D none"
    # environemnts
    alias docker-cleanup="docker system prune --all --volumes" # && docker volume rm -i $(docker volume ls | awk '{print $3}' | grep -v 'NAME')
    alias vm-cleanup="virsh undefine --remove-all-storage --delete-snapshots --domain"

    ###############################
    ### Beautify terminal apps  ###
    ###############################
    alias print-devider="printf '%*s\n' (tput cols) '' | tr ' '" # call with devider char
    # Colorize (may make output not grep-able)
    alias ip="ip -c"
    alias ls='ls --color=auto'
    alias pacman='sudo pacman --color auto'
    alias grep='  grep --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias highlight='grep -A100'
    # Readable format
    alias df='df -h'
    alias lsblk='lsblk -fs'

    #########################
    ### System Management ###
    #########################
    alias yay="paru"
    alias free="free -mt"
    alias gksudo="pkexec"
    #################
    ## Check Stuff ##
    #################
    # basic hw/sw checks
    alias check-hw="hwinfo --short" #check hardware (short summary)
    alias check-hw-cpu="cpuid -i | grep uarch | head -n 1"
    alias check-hw-disk-io="sudo iotop -o -a"
    alias check-hw-disk-speed="sudo hdparm -tT"
    alias check-hw-memory="free -mt"
    alias check-sw-audio="pactl info | grep 'Server Name'" # (pulseaudio or pipewire)
    alias check-sw-microcode='grep . /sys/devices/system/cpu/vulnerabilities/*' # microcode vulnerabilities
    alias check-sw-probe="sudo -E hw-probe -check -minimal -all -show"
    ################
    ## List Stuff ##
    ################
    # Logs
    alias log-system="printf 'Showing logs of last 10 minutes\n'; sudo journalctl --no-page --since='10 minutes ago' && printf '\n%*s\n\n' (tput cols) '' | tr ' ' '=' && sudo dmesg --since '10 minutes ago'"
    alias log-system-now="sudo dmesg --follow-new &; sudo journalctl --follow --since 'now' &;"
    alias log-systemd-user="systemctl status systemd-logind.service ; systemctl status user@$(id -u).service"
    alias log-calamares="tail -f /var/log/Calamares.log"
    alias log-pacman="   tail -f /var/log/pacman.log"
    alias log-xorg="     tail -f /var/log/Xorg.0.log"
    alias log-xorg-old=" tail -f /var/log/Xorg.0.log.old"
    alias log-sddm="     tail -f ~/.local/share/sddm/*.log"
    alias log-notifications="makoctl history # | jq '.data[0][].body.data'"
    # System info
    alias list-system-usage="top -u nobody -bn1 | head -n 5"
    alias list-system-info="inxi"
    alias list-systemd-failed="systemctl list-units --state=failed"
    alias list-fonts="fc-list --format \"%{family}\n\""
    alias list-grub-entries="sudo awk -F \' '$1==\"menuentry \" || $1==\"submenu \" {print i++ \"     : \" $2}; /\smenuentry / {print \"\t\" i-1\">\"j++ \" : \" $2};' /boot/grub/grub.cfg"
    # Session info
    alias list-keys-ssh="ssh-add -l"
    alias list-users-ssh="grep --color=none 'AllowedUsers' /etc/ssh/sshd_config{,.d/*} || fish -c \"getent passwd | grep --color=none -v '/nologin' | awk -F ':' '{print $1}'\""
    alias list-users-login="cat /etc/passwd | grep -v nologin" # List of existing useres on the machine
    alias list-groups="cat /etc/group | sed 's/:[^:]*:[^:]*:/\t/g'"
    alias list-session-activ="w -i -p" # add -h for no header (for use in scripts)
    alias list-session-xorg="ls /usr/share/xsessions" # List xorg    sessions
    alias list-session-wayland="ls /usr/share/wayland-sessions" # List wayland sessions
    # Network
    alias list-net-port="netstat -tunlp | sort -t: -k4 -n | grep LISTEN"
    # Packages
    # HOW 2 (EXTENDED USAGE): pacman -S --needed - < my-list-of-packages.txt # E.g. install packages from a list
    alias list-packs="sudo pacman -Qqe" # List of explicitly installed packages
    alias list-packs-info="pacman -Sii"
    alias list-packs-repo="sudo paclist"
    alias list-packs-aur="sudo pacman -Qqem" # List of AUR packages
    alias list-packs-explicit="sudo pacman -Qqet" # List of explicitly installed packages without deps
    alias list-packs-size="expac -H M '%m\t%n' | sort -h | nl" # List of package sizes
    alias list-packs-owner='pacman -Qo'
    alias list-packs-recent="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
    alias list-packs-recent-extended="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"
    alias list-packs-broken="sudo pacman -Qk 2>/dev/null | grep -v ' 0 missing files' | cut -d: -f1"
    alias list-packs-desktop="find /usr/share/applications/ /usr/local/share/applications/ ~/.local/share/applications/ -type f -name '*.desktop' 2>/dev/null"
    alias list-packs-outdated="checkupdates"


    ##########################
    ### Software managment ###
    ##########################
    alias packs-add='    sudo pacman -S'
    alias packs-install='packs-add'
    alias packs-remove=' sudo pacman -Rns'
    alias packs-uninstall='packs-remove'
    alias packs-owner='  sudo pacman -Qo'
    alias packs-deps='   sudo pacman -Sii'
    alias packs-update=' sudo pacman -Syyu'
    alias packs-cleanup='pacman -Scc && sudo pacman -Rns $(pacman -Qqtd)' # Cleanup orphaned packages
    alias packs-missing="pacman -Dkk"
    alias packs-set-explicit=' pacman -D --asexplicit'
    alias packs-set-dependecy='pacman -D --asdeps'
    # verify signatures
    alias check-gpg="gpg2 --keyserver-options auto-key-retrieve --verify"
    alias check-ssh="ssh -T"

    #########################
    ### Aliases for fixes ###
    #########################
    ### app fix
    alias fix-qt="export QT_QPA_PLATFORM='wayland;xcb'"
    alias fix-ssh='ssh-add -D && set TERM "vt100" && echo "Please load your ssh keys again"' # Will remove all ssh keys
    alias fix-docker-ports="sudo sysctl -w net.ipv4.ip_unprivileged_port_start=80"
    ### system fix
    alias fix-sudo="faillock --reset" # password rejects
    alias fix-permissions-user="sudo chown -R $USER:$USER ~/.config ~/.local"
    alias fix-gpg-pacman="[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done'"
    alias fix-gpg-database="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
    # package-manager
    alias fix-lock-yay="    sudo rm -i /var/lib/pacman/db.lck"
    alias fix-lock-pamac="  sudo rm -i /var/tmp/pamac/dbs/db.lock"
    alias fix-lock-pacman=" sudo rm -i /var/lib/pacman/db.lck"
    alias fix-keys="                /usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
    alias fix-keys-pacman="         /usr/local/bin/arcolinux-fix-pacman-gpg-conf"
    alias fix-packs-broken="sudo pacman -S \$(sudo pacman -Qk 2>/dev/null | grep -v ' 0 missing files' | cut -d: -f1)"
    ### config related
    alias fix-conf-grub="/usr/local/bin/arcolinux-fix-grub"
    alias fix-conf-pacman="         /usr/local/bin/arcolinux-fix-pacman-conf"
    alias fix-conf-sddm="/usr/local/bin/arcolinux-fix-sddm-config"
    ### default config restore
    alias reset-vim=' cp /etc/skel/.vimrc ~/.vimrc && rm -i ~/.vim && cp /etc/skel/.vim ~/.vim && echo "Restored vim"'
    alias reset-zsh=' cp /etc/skel/.zshrc                   ~/.zshrc                           && echo "Restored zsh"'
    alias reset-bash='cp /etc/skel/.bashrc                  ~/.bashrc                          && echo "Restored bash"'
    alias reset-fish='cp /etc/skel/.config/fish/config.fish ~/.config/fish/config.fish         && echo "Restored fish"'

    ##############################
    ### File System Maintenace ###
    ##############################
    alias list-file-info="stat"
    alias list-file-size="sudo du -shc"
    alias list-file-mime="file --mime-type"
    alias list-drive-ids="lsblk -io KNAME,TYPE,SIZE,MODEL,LABEL | awk '\$2 != \"loop\" { print }'"
    alias list-drive-size="df -h"
    alias list-drive-busy="lsof -R"
    alias list-drive-mounts="df -h | grep -E --color=never '/dev/[^(loop|dm\-0)]|//'"
    alias list-drive-partitions="lsblk -o name,label,fstype,fsuse%,RO,HOTPLUG -e7"
    alias list-btrfs-snapshots="sudo timeshift --list"
    alias list-btrfs-filesystem="sudo btrfs filesystem df /"
    alias list-btrfs-subvolumes="sudo btrfs su li -t /"
    alias btrfs-compress="sudo btrfs filesystem defragment -r -v -czstd"
    alias btrfs-balance="sudo btrfs balance start -dusage=66"

end # End of interactive prompt config
