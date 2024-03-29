### EXPORT ###
 export EDITOR='nano'
 export VISUAL='nano'
 export HISTCONTROL=ignoreboth:erasedups
 export PAGER='most'
 export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
 export VKD3D_CONFIG=dxr11,dxr # Intel Arc hw-raytracing support
 export QT_QPA_PLATFORM=wayland
#export TERM=vt100 # Fix for unrecognized terminal while using ssh (sets generic term., not recommended)

#Ibus settings if you need them
#type ibus-setup in terminal to change settings and start the daemon
#delete the hashtags of the next lines and restart
#export GTK_IM_MODULE=ibus
#export QT_IM_MODULE=ibus
#export XMODIFIERS=@im=dbus

PS1='[\u@\h \W]\$ '

## If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

#shopt "Additional Shell Options"
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases

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
#redirect windows commands
 alias dir='ls'

  ###########################
 ### Enable themed text  ###
###########################
# Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias pacman='sudo pacman --color auto'
#readable output
alias df='df -h'
#update fonts
alias update-fc='sudo fc-cache -fv'
#update betterlockscreen images
alias update-bls="betterlockscreen -u /usr/share/backgrounds/arcolinux/"

  #################################################
 ### Aliases for Input & Basic system settings ###
#################################################
#keyboard
alias give-me-qwerty-us="sudo localectl set-x11-keymap us"
alias give-me-qwerty-de="sudo localectl set-x11-keymap de"
#locale (language, keyboard)
alias setlocale="sudo localectl set-locale LANG=en_US.UTF-8"
alias setlocales="sudo localectl set-x11-keymap de && sudo localectl set-locale LANG=en_US.UTF-8"

  ######################################
 ### Aliases for Software (Controll) ###
#######################################
#ls (Quicker directory listing)
alias l='ls'
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -alFh'
# ssh cleanup
alias ssh='clear && TERM=vt100 ssh'
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

  ######################################
 ### Aliases for System Information ###
######################################
## Check Stuff
alias checkhw="hwinfo --short"                                   #check hardware (short summary)
alias checklog="journalctl -p 3 -xb"                             #check logs
alias checkaudio="pactl info | grep 'Server Name'"               #check audio (pulseaudio or pipewire)
alias checkcpu="cpuid -i | grep uarch | head -n 1"               #check cpu
alias checkmc='grep . /sys/devices/system/cpu/vulnerabilities/*' #check microcode vulnerabilities
## List installed packages
# EXTENDED USAGE: pacman -S --needed - < my-list-of-packages.txt # Install packages from a list
alias list-packs="         sudo pacman -Qqe"               # List of explicitly installed packages
alias list-packs-explicit="sudo pacman -Qqet"              # List of explicitly installed packages without deps
alias list-packs-aur="     sudo pacman -Qqem"              # List of AUR packages
alias list-packs-size="expac -H M '%m\t%n' | sort -h | nl" # List of package sizes
function_depends()  { search=$(echo "$1"); sudo pacman -Sii $search | grep "Required" | sed -e "s/Required By     : //g" | sed -e "s/  /\n/g";}
alias list-packs-depends='function_depends'
# List network
alias list-net-ipv4="nmap $(ip -4 addr list  | awk '/inet.*brd/ {print $2}' | head -1) -F --open -oG - | cut -d ' ' -f 2-3 | grep Ports:"
#Reading logs (bat)
alias log-calamares="bat /var/log/Calamares.log"
alias log-pacman="   bat /var/log/pacman.log"
alias log-xorg="     bat /var/log/Xorg.0.log"
alias log-xorg-old=" bat /var/log/Xorg.0.log.old"
#Recent Installed Packages
alias rip="    expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"
#Graphics card information
alias whichvga="/usr/local/bin/arcolinux-which-vga"
#systeminfo
alias sysfailed="systemctl list-units --failed"
alias probe="sudo -E hw-probe -all -upload"
alias free="free -mt"

  ######################################
 ### Aliases for software managment ###
######################################
#pacman
alias app-setup='sudo pacman -S'
alias app-remove='sudo pacman -R'
alias app-owner='sudo pacman -Qo'
alias app-deps='sudo pacman -Sii'
alias app-update='sudo pacman -Syyu'
alias app-cleanup='sudo pacman -Rns $(pacman -Qtdq)' # Cleanup orphaned packages
#skip integrity check
alias yayskip='yay -S --mflags --skipinteg'
#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"
#receive developer keys
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-keyserver="[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done'"
#verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias fix-gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"

  #########################
 ### Aliases for fixes ###
#########################

# package-manager fixes
alias fix-lock-pamac="sudo rm /var/tmp/pamac/dbs/db.lock"
alias fix-lock-pacman="sudo rm /var/lib/pacman/db.lck"
alias fix-lock-logout="sudo rm /tmp/arcologout.lock"

alias fix-conf-pacman="/usr/local/bin/arcolinux-fix-pacman-conf"

alias fix-keys="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-keys-pacman="/usr/local/bin/arcolinux-fix-pacman-gpg-conf"

## config related fixes ##

# restore shell configs
alias restore-default-bash='cp /etc/skel/.bashrc                  ~/.bashrc                  && exec bash'
alias restore-default-zsh=' cp /etc/skel/.zshrc                   ~/.zshrc                   && echo "Copied."'
alias restore-default-fish='cp /etc/skel/.config/fish/config.fish ~/.config/fish/config.fish && echo "Copied."'
alias fix-sddm-config="/usr/local/bin/arcolinux-fix-sddm-config"
alias fix-grub="/usr/local/bin/arcolinux-fix-grub"

# permission fixes
alias fix-permissions="sudo chown -R $USER:$USER ~/.config ~/.local"

## application specific fixes
#git
alias rmgitcache="rm -r ~/.cache/git"
alias grh="git reset --hard"
  ############################################
 ### Aliases for Maintenace & File System ###
############################################

#maintenance
alias downgrad-arco="sudo downgrade --ala-url https://ant.seedhost.eu/arcolinux/"
# File system management
alias list-btrfs-snapshots="sudo timeshift --list"
alias list-btrfs-filesystem="sudo btrfs filesystem df /"
alias list-btrfs-subvolumes="sudo btrfs su li / -t"
alias btrfs-compress="sudo btrfs defragment -r -v -czstd"    # compress using zstd
alias btrfs-balance="sudo btrfs balance start -dusage=66"
# List session info
alias list-users="cut -d: -f1 /etc/passwd | sort" # List of existing useres on the machine
alias list-session-xorg="   ls /usr/share/xsessions"        # List xorg    sessions
alias list-session-wayland="ls /usr/share/wayland-sessions" # List wayland sessions

  #############
 ### Other ###
#############

## arch linux rolling load personal config
# See: https://arcolinuxb.com/create-the-personal-folder-on-your-current-system-and-use-the-alias-personal/
alias personal='cp -Rf /personal/* ~'
# extend this config using personal config in '~/' named '.bashrc-personal' (not overwritten on skel restore)
[[ -f ~/.bashrc-personal ]] && . ~/.bashrc-personal

  #######################
 ### Terminal output ###
#######################

printDevider() {
  printf "\n"
  printf %"$COLUMNS"s  | tr " " "-"
}
# clear # Clear all previous text from terminal for a cleaner look (not always recommended)
if [[ $(tput lines) -ge 25 ]]; then # min term hight 25
  # terminal reporting tools
  neofetch --source ~/.config/neofetch/great-wave-transparent-2.png --size 400px

  printDevider

  if [[ $(tput lines) -ge 50 ]]; then # min term hight 50

    # List IP information:
    # Get ip via Local machine
     echo   "Local  IPv4-Address: $(ip -4 addr | grep global | sed -e's/^.*inet \([^ ]*\)\/.*$/\1/;t;d' | sed -e :a -e '/$/N; s/\n/\ ; /; ta' )"
    #printf "Global IPv6-Address: $(ip -6 addr | grep global | sed -e's/^.*inet6 \([^ ]*\)\/.*$/\1/;t;d'  | head -1)"
    # Get ip via External provider
    #echo   "Global IPv4-Address: $(dig    TXT +short ch whoami.cloudflare @1.0.0.1           | sed 's/"//g')"
    #printf "Global IPv6-Address: $(dig -6 TXT +short o-o.myaddr.l.google.com @ns1.google.com | sed 's/"//g')"
	 printDevider

    if systemctl is-active --quiet docker; then
	  # Docker installed
      echo "Docker Containers (Running): "
      echo -e "| ID \t\t| Image \t\t| Names \t| Ports \t\t\t\t| Mounts \t\t\t\t|"
      docker ps --filter status=running --format '| {{.ID}}\t| {{ .Image }}\t| {{.Names}}\t| {{ .Ports }}\t|{{.Mounts}}\t|' | sed 's/0.0.0.0://g' | sed 's/:::..->........//g' | sed 's/:::...->.........//g' | sed 's/:::....->........, //g' | sed 's/, :::.............*//g' | sed 's/\/tcp/ /g'
      echo ""
      echo "Docker Containers (Exited): "
      docker ps -a --filter status=exited --format '| {{.ID}}\t| {{ .Image }}\t| {{.Names}}\t| {{.Mounts}}\t|'
      printDevider

      # echo \n"Docker Containers (Stats):"
      # docker stats --no-stream
      # printDevider
    fi # End of docker installed

    #echo "Drives and Mountpoints:"
    #lsblk -fs
    #printDevider

    # echo "Port Services & Connections"
    # netstat -antop | awk '{ print($4"\t"$6" |\t")}' | grep -o :.* # Note printf => same line ; print => ne>
    # printDevider

    fi # ENDOF min term hight 50
fi # ENDOF min term hight 25

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# Load Angular CLI autocompletion.
source <(ng completion script)
