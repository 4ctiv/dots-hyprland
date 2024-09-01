if status is-interactive
  ### SSH-Agent ###
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
  #if [ "$(pgrep ssh-agent -o)" ]
  # set -Ux SSH_AGENT_PID "$(pgrep ssh-agent -o)"
  #else
  # eval (ssh-agent -c)
  # set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  # set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  #end
  ### Shell prompt ###
  neofetch --source ~/.config/neofetch/great-wave-transparent-2.png --size 400px
end # End interactive only code-block

  ########################
 ###     Theming      ###
########################
# set fish_color_... "0xfffffff"


  ########################
 ### Typo redirection ###
########################
alias cd..='cd ..'
alias udpate='sudo pacman -Syyu'
alias upate='sudo pacman -Syyu'
alias updte='sudo pacman -Syyu'
alias updqte='sudo pacman -Syyu'
alias upqll='paru -Syu --noconfirm'
alias upal='paru -Syu --noconfirm'
alias claer="clear"
alias gtop="btop"
#redirect windows commands
alias dir='ls'

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
#alias ssh=function_ssh # Will not work as it breaks rekursively
#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias install-grub-efi="sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi" #grub issue 08/2022
# wget download continue (last)
alias wget="wget -c"
# ps (running process tree)
alias psa="ps auxf"
#yt-dpl download (youtube vid's)
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "
alias ytv-mp4="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "
#hblock (web tracking block via hosts file)
alias unhblock="hblock -S none -D none"
alias app-web="brave --app"

  ################################
 ### Colorfull terminal apps  ###
################################
alias ls='ls --color=auto'
# Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias pacman='sudo pacman --color auto'
#readable output
alias df='df -h'
#add new fonts
alias update-fc='sudo fc-cache -fv'
#update betterlockscreen images
alias update-bls="betterlockscreen -u /usr/share/backgrounds/arcolinux/"
alias highlight='grep -A100' # Usage: COMMAND | highlight"

  #####################################
 ### Aliases for System Management ###
#####################################
#################
## Check Stuff ##
#################
alias check-hw="hwinfo --short"                                   #check hardware (short summary)
alias check-log="journalctl -p 3 -xb"                             #check systemlogs
alias check-audio="pactl info | grep 'Server Name'"               #check audio (pulseaudio or pipewire)
alias check-cpu="cpuid -i | grep uarch | head -n 1"               #check cpu
alias check-mc='grep . /sys/devices/system/cpu/vulnerabilities/*' #check microcode vulnerabilities
################
## List Stuff ##
################
# Logs
alias list-log-system="sudo dmesg --follow"
alias list-log-calamares="bat /var/log/Calamares.log"
alias list-log-pacman="   bat /var/log/pacman.log"
alias list-log-xorg="     bat /var/log/Xorg.0.log"
alias list-log-xorg-old=" bat /var/log/Xorg.0.log.old"
# System info
alias whichvga="/usr/local/bin/arcolinux-which-vga"
alias sysfailed="systemctl list-units --failed"
alias probe="sudo -E hw-probe -all -upload"
alias free="free -mt"
# Session info
alias list-users="cut -d: -f1 /etc/passwd | sort" # List of existing useres on the machine
alias list-session-xorg="   ls /usr/share/xsessions"        # List xorg    sessions
alias list-session-wayland="ls /usr/share/wayland-sessions" # List wayland sessions
# Network
alias list-net-ipv4="nmap $(ip -4 addr list  | awk '/inet.*brd/ {print $2}' | head -1) -F --open -oG - | cut -d ' ' -f 2-3 | grep Ports: | sed 's/Ports://g'"
alias list-net-port="sudo netstat -tunlp"
# Packages
# HOW 2 (EXTENDED USAGE): pacman -S --needed - < my-list-of-packages.txt # E.g. install packages from a list
alias list-packs="         sudo pacman -Qqe"               # List of explicitly installed packages
alias list-packs-explicit="sudo pacman -Qqet"              # List of explicitly installed packages without deps
alias list-packs-aur="     sudo pacman -Qqem"              # List of AUR packages
alias list-packs-broken="  sudo pacman -Qk 2>/dev/null | grep -v ' 0 missing files' | cut -d: -f1" 
alias list-packs-size="expac -H M '%m\t%n' | sort -h | nl" # List of package sizes
alias list-packs-depends=function_depends
alias list-packs-recent="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias list-packs-recent-extended="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"
alias list-packs-desktop="ls /usr/share/applications/ /usr/local/share/applications/ ~/.local/share/applications/ | sed 's/.desktop//g'"
alias list-packs-desktop-all="find / -iname \"*desktop\" -type f -not -path \"/media*\" 2> /dev/null"

##########################
### Software managment ###
##########################
alias packs-setup='  sudo pacman -S'
alias packs-remove=' sudo pacman -R'
alias packs-owner='  sudo pacman -Qo'
alias packs-deps='   sudo pacman -Sii'
alias packs-update=' sudo pacman -Syyu'
alias packs-cleanup='sudo pacman -Rns $(pacman -Qtdq)' # Cleanup orphaned packages
#skip integrity check (unsave !!!)
alias yayskip='yay -S --mflags --skipinteg'
#verify signature for isos
alias check-gpg="gpg2 --keyserver-options auto-key-retrieve --verify"
#Downgrade system
alias downgrad-arco="sudo downgrade --ala-url https://ant.seedhost.eu/arcolinux/"

  #########################
 ### Aliases for fixes ###
#########################
#fix sudo pwd reject
alias fix-sudo="faillock --reset"
#receive developer keys
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-keyserver="[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done'"
## package-manager fixes ##
alias fix-lock-pamac=" sudo rm /var/tmp/pamac/dbs/db.lock"
alias fix-lock-pacman="sudo rm /var/lib/pacman/db.lck"
alias fix-lock-logout="sudo rm /tmp/arcologout.lock"
alias fix-conf-pacman="/usr/local/bin/arcolinux-fix-pacman-conf"
alias fix-keys="       /usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-keys-pacman="/usr/local/bin/arcolinux-fix-pacman-gpg-conf"
alias fix-packs-broken="sudo pacman -S (list-packs-broken | tr '\n' ' ')"
## config related fixes ##
# restore shell configs
alias restore-default-bash='cp /etc/skel/.bashrc                  ~/.bashrc                  && exec bash'
alias restore-default-zsh=' cp /etc/skel/.zshrc                   ~/.zshrc                   && echo "Copied."'
alias restore-default-fish='cp /etc/skel/.config/fish/config.fish ~/.config/fish/config.fish && echo "Copied."'
alias fix-sddm-config="/usr/local/bin/arcolinux-fix-sddm-config"
alias fix-grub="       /usr/local/bin/arcolinux-fix-grub"
# permission fixes
alias fix-permissions="sudo chown -R $USER:$USER ~/.config ~/.local"
## application specific fixes ##
#git
alias rmgitcache="rm -r ~/.cache/git"
alias grh="git reset --hard"
#systemd
#https://www.tecmint.com/disable-suspend-and-hibernation-in-linux/
alias hibernation-enable="sudo systemctl unmask hibernate.target"
alias hibernation-disable="sudo systemctl mask hibernate.target"
# Set QT platform
alias fix-qt-platform="export QT_QPA_PLATFORM='wayland;xcb'"

###############################
### File System  Maintenace ###
###############################
# Filesystem (btrfs)
alias list-drive-busy="sudo lsof"
alias list-btrfs-snapshots="sudo timeshift --list"
alias list-btrfs-filesystem="sudo btrfs filesystem df /"
alias list-btrfs-subvolumes="sudo btrfs su li -t /"
alias btrfs-compress="sudo btrfs filesystem defragment -r -v -czstd"
alias btrfs-balance="sudo btrfs balance start -dusage=66"
alias list-filesize="sudo du -shc"
# Session info
alias list-users="cut -d: -f1 /etc/passwd | sort" # List of existing useres on the machine
alias list-session-xorg="   ls /usr/share/xsessions"        # List xorg    sessions
alias list-session-wayland="ls /usr/share/wayland-sessions" # List wayland sessions

