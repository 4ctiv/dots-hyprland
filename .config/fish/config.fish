if status is-interactive
  ### SSH-Agent ###
  source ~/.profile
  #export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket" # ssh daemon userland
  #export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/docker.sock" # Docker userland
  #if [ "$(pgrep ssh-agent -o)" ]
  # set -Ux SSH_AGENT_PID "$(pgrep ssh-agent -o)"
  #else
  # eval (ssh-agent -c)
  # set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  # set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  #end
  ### Shell prompt ###
  if test -z $TERM_PROGRAM
    fastfetch -l ~/.config/neofetch/great-wave-transparent-2.png --logo-height 12 &
  else
    clear
    hostnamectl | grep -E '([Oo]perating System|[Kk]ernel|[A]rchitecture)'
    echo "Currently $(who -u | wc -l) users are logged in" | grep '[0-9]'
    echo ""
    echo "CPU usage: $(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%02d%%\n", int(0.5+usage)}')"
    echo "RAM usage: $(printf "%02d%%\n" $(math --scale 0 "($(grep 'MemFree' /proc/meminfo | awk '{print $2}') / $(grep 'MemTotal' /proc/meminfo | awk '{print $2}')) * 100"))"
    echo "GPU usage: $(echo "??" 2>/dev/null)%"
    echo ""
    git status --short 2>/dev/null # Only output status if in git repo
  end

  ########################
 ###     Paths      ###
########################
# Set golang install folder
# export PATH="$PATH:/usr/local/go/bin"

   ########################
 ###     Theming      ###
########################
# set fish_color_... "0xfffffff"


  ########################
 ### Typo redirection ###
########################
alias cd..='cd ..'
alias nano='vim'
alias udpate='sudo pacman -Syyu'
alias upate=' sudo pacman -Syyu'
alias updte=' sudo pacman -Syyu'
alias updqte='sudo pacman -Syyu'
alias claer="clear"
alias gtop="btop"
alias neofetch="fastfetch -l .config/neofetch/great-wave-transparent-2.png --logo-height 20"
#redirect windows commands
alias dir='ls'
alias diskmgmt="sudo cfdisk"

  #################################################
 ### Aliases for Input & Basic system settings ###
#################################################
#keyboard
alias set-keyboard-layout-qwerty-us="sudo localectl set-x11-keymap us"
alias set-keyboard-layout-qwerty-de="sudo localectl set-x11-keymap de"
#locale (language, keyboard)
alias set-locales="sudo localectl set-x11-keymap de && sudo localectl set-locale LANG=en_US.UTF-8"

  ######################################
 ### Aliases for Software (Controll) ###
#######################################
# replace docker with podman
#alias docker="podman"
#alias docker-compose="podman-compose"
#ls (Quicker directory listing)
alias l='ls'
alias la='ls -la'
# set ssh generic terminal
alias ssh-generic='clear && TERM=vt100 ssh'
#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias install-grub-efi="sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi" #grub issue 08/2022
# wget download continue (last)
alias wget="wget -c"
# ps (running process tree)
alias psa="ps auxf"
# debug
alias hex-ascii="hexdump -C"
alias free="free -mt"
#yt-dpl (youtube)
alias yt-audio="yt-dlp --extract-audio --audio-format best "
alias yt-video="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "
#web access
alias web-app="brave --app"
alias unhblock="hblock -S none -D none"

  ###############################
 ### Beautify terminal apps  ###
###############################
# NOTE: These are also used by aliases and may break some functionalities
alias highlight='grep -A100' # Usage: COMMAND | highlight"
alias ls='ls --color=auto'
alias ip="ip -c"
# Colorize the grep command output for ease of use (good for log files)##
alias grep='   grep --color=auto'
alias egrep=' egrep --color=auto'
alias fgrep=' fgrep --color=auto'
alias pacman='sudo pacman --color auto'
#readable output
alias df='df -h'
alias lsblk='lsblk -fs'

  #####################################
 ### Aliases for System Management ###
#####################################
alias yay="paru"
alias gksudo="pkexec" # policy kit (polkit) exec
##################
## Update Stuff ##
##################
alias update-font='sudo fc-cache -fv'
#################
## Check Stuff ##
#################
alias check-hw="hwinfo --short"                                   #check hardware (short summary)
alias check-audio="pactl info | grep 'Server Name'"               #check audio (pulseaudio or pipewire)
alias check-cpu="cpuid -i | grep uarch | head -n 1"               #check cpu
alias check-memory="free -mt"
alias check-mc='grep . /sys/devices/system/cpu/vulnerabilities/*' #check microcode vulnerabilities
alias check-disk-speed="sudo hdparm -tT"
alias check-system-probe="sudo -E hw-probe -check -minimal -all -show"
#alias check-fish-startup="time fish --profile-startup /tmp/startup.prof -c exit && sort -nk2 /tmp/startup.prof | less"
################
## List Stuff ##
################
# Logs
alias log-system="sudo dmesg; sudo journalctl;"
alias log-system-now="sudo dmesg --follow-new &; sudo journalctl --follow --since 'now' &;"
alias log-systemd-user="systemctl status systemd-logind.service ; systemctl status user@$(id -u).service"
alias log-calamares="cat /var/log/Calamares.log"
alias log-pacman="   cat /var/log/pacman.log"
alias log-xorg="     cat /var/log/Xorg.0.log"
alias log-xorg-old=" cat /var/log/Xorg.0.log.old"
alias log-sddm="     cat ~/.local/share/sddm/*.log"
alias log-notifications="makoctl history # | jq '.data[0][].body.data'"
# System info
alias list-system-usage="top -u nobody -bn1 | head -n 5"
alias list-system-info="inxi"
alias list-systemd-failed="systemctl list-units --state=failed"
alias list-fonts="fc-list --format \"%{family}\n\""
alias list-grub-entries="sudo awk -F \' '$1==\"menuentry \" || $1==\"submenu \" {print i++ \"     : \" $2}; /\smenuentry / {print \"\t\" i-1\">\"j++ \" : \" $2};' /boot/grub/grub.cfg"
# Session info
alias list-ssh-keys="ssh-add -l"
alias list-ssh-users="grep --color=none 'AllowedUsers' /etc/ssh/sshd_config{,.d/*} || fish -c \"getent passwd | grep --color=none -v '/nologin' | awk -F ':' '{print $1}'\""
alias list-users="cut -d: -f1 /etc/passwd | sort" # List of existing useres on the machine
alias list-users-activ="w -i -p" # add -h for no header (for use in scripts)
alias list-session-xorg="   ls /usr/share/xsessions"        # List xorg    sessions
alias list-session-wayland="ls /usr/share/wayland-sessions" # List wayland sessions
# Network
#func list-net-ipv4
alias list-net-port="netstat -tunlp | sort -t: -k4 -n | grep LISTEN"
# Packages
# HOW 2 (EXTENDED USAGE): pacman -S --needed - < my-list-of-packages.txt # E.g. install packages from a list
alias list-packs="         sudo pacman -Qqe"               # List of explicitly installed packages
alias list-packs-repo="    sudo paclist"
alias list-packs-explicit="sudo pacman -Qqet"              # List of explicitly installed packages without deps
alias list-packs-aur="     sudo pacman -Qqem"              # List of AUR packages
alias list-packs-broken="  sudo pacman -Qk 2>/dev/null | grep -v ' 0 missing files' | cut -d: -f1" 
alias list-packs-size="expac -H M '%m\t%n' | sort -h | nl" # List of package sizes
alias list-packs-recent="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias list-packs-recent-extended="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"
alias list-packs-desktop="ls /usr/share/applications/* ~/.local/share/applications/* | sed 's/.desktop//g'"
alias list-packs-desktop-all="find /usr/share/applications/ /usr/local/share/applications/ ~/.local/share/applications/ -type f -name '*.desktop'"
alias list-packs-outdated="checkupdates"
alias list-pack-owner='  pacman -Qo'
alias list-pack-info='   pacman -Sii'
#find / -iname \"*desktop\" -type f -not -path \"/media*\" 2> /dev/null"

##########################
### Software managment ###
##########################
alias packs-add='  sudo pacman -S'
alias packs-remove=' sudo pacman -R'
alias packs-owner='  sudo pacman -Qo'
alias packs-deps='   sudo pacman -Sii'
alias packs-update=' sudo pacman -Syyu'
alias packs-as-explicit='pacman -D --asexplicit'
alias packs-as-dependecy='pacman -D --asdeps'
alias packs-cleanup='sudo pacman -Rns $(pacman -Qtdq)' # Cleanup orphaned packages
alias packs-missing="pacman -Dkk"
#skip integrity check (unsave !!!)
alias yay-skip='yay -S --mflags --skipinteg'
#verify signature for isos
alias check-gpg="gpg2 --keyserver-options auto-key-retrieve --verify"
alias update-systemctl="sudo sysctl --system"

  #########################
 ### Aliases for fixes ###
#########################
#fix docker
alias fix-docker-unpriv-network="sudo sysctl -w net.ipv4.ip_unprivileged_port_start=80"
#fix sudo
alias fix-sudo="faillock --reset" # password rejects
alias fix-permissions="sudo chown -R $USER:$USER ~/.config ~/.local"
#receive developer keys
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-keyserver="[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done'"
## package-manager fixes ##
alias fix-lock-yay="    sudo rm /var/lib/pacman/db.lck"
alias fix-lock-pamac="  sudo rm /var/tmp/pamac/dbs/db.lock"
alias fix-lock-pacman=" sudo rm /var/lib/pacman/db.lck"
alias fix-conf-pacman="         /usr/local/bin/arcolinux-fix-pacman-conf"
alias fix-keys="                /usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-keys-pacman="         /usr/local/bin/arcolinux-fix-pacman-gpg-conf"
alias fix-packs-broken="sudo pacman -S \$(sudo pacman -Qk 2>/dev/null | grep -v ' 0 missing files' | cut -d: -f1)"
## config related fixes ##
# restore shell configs
alias restore-default-bash='cp /etc/skel/.bashrc                  ~/.bashrc                  && echo "Restored bash"'
alias restore-default-zsh=' cp /etc/skel/.zshrc                   ~/.zshrc                   && echo "Restored zsh"'
alias restore-default-fish='cp /etc/skel/.config/fish/config.fish ~/.config/fish/config.fish && echo "Restored fish"'
# permission fixes
alias fix-permissions-user="sudo chown -R $USER:$USER ~/.config ~/.local"
## application specific fixes ##
alias fix-grub="       /usr/local/bin/arcolinux-fix-grub"
alias fix-sddm-config="/usr/local/bin/arcolinux-fix-sddm-config"
#git
alias git-pull="git stash push -m 'Pre pull $(date +%F_%H-%M)' && git pull --rebase && git stash pop"
alias git-reset="git reset --hard"
alias git-clean-cache="rm -r ~/.cache/git"
#systemd
#https://www.tecmint.com/disable-suspend-and-hibernation-in-linux/
alias hibernation-enable="sudo systemctl unmask hibernate.target"
alias hibernation-disable="sudo systemctl mask hibernate.target"
# Set QT platform
alias fix-qt-platform="export QT_QPA_PLATFORM='wayland;xcb'"

###############################
### File System  Maintenace ###
###############################
# Filesystem
alias list-partitions="lsblk -o name,label,fstype,fsuse%,uuid"
alias list-drive-busy="lsof -R"
alias list-drive-mounts="df -h | grep -E --color=never '/dev/[^(loop|dm\-0)]|//'"
alias list-btrfs-snapshots="sudo timeshift --list"
alias list-btrfs-filesystem="sudo btrfs filesystem df /"
alias list-btrfs-subvolumes="sudo btrfs su li -t /"
alias btrfs-compress="sudo btrfs filesystem defragment -r -v -czstd"
alias btrfs-balance="sudo btrfs balance start -dusage=66"
alias list-size-drive="df -h"
alias list-size-file="sudo du -shc"
alias check-file-info="stat"
alias list-file-mime="file --mime-type"
# Session info
alias list-users="cut -d: -f1 /etc/passwd | sort" # List of existing useres on the machine
alias list-session-xorg="   ls /usr/share/xsessions"        # List xorg    sessions
alias list-session-wayland="ls /usr/share/wayland-sessions" # List wayland sessions

end # End of interactive prompt config
