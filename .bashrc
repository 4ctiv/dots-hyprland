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
#export XMODIFIERS=@im=dbus
#export QT_IM_MODULE=ibus

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

#################
 #### ALIASES ####
#################

### Usefull redirections ###
alias ssh='clear && ssh'
## redirect obvious typo's
alias cd..='cd ..'
alias udpate='sudo pacman -Syyu'
alias upate='sudo pacman -Syyu'
alias updte='sudo pacman -Syyu'
alias updqte='sudo pacman -Syyu'
alias upqll='paru -Syu --noconfirm'
alias upal='paru -Syu --noconfirm'
alias claer="clear"
## redirect windows commands
alias dir='ls'

### Aliases for Theming ###
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

### Aliases for Input & Basic system settings ###
#keyboard
alias give-me-qwerty-us="sudo localectl set-x11-keymap us"
alias give-me-qwerty-de="sudo localectl set-x11-keymap de"
#locale (language, keyboard)
alias setlocale="sudo localectl set-locale LANG=en_US.UTF-8"
alias setlocales="sudo localectl set-x11-keymap de && sudo localectl set-locale LANG=en_US.UTF-8"

### Aliases for Software Switching ###
#switch terminal
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"
#switch login manager
alias tolightdm="sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings --noconfirm --needed ; sudo systemctl enable lightdm.service -f ; echo 'Lightm is active - reboot now'"
alias tosddm="sudo pacman -S sddm --noconfirm --needed ; sudo systemctl enable sddm.service -f ; echo 'Sddm is active - reboot now'"
alias toly="sudo pacman -S ly --noconfirm --needed ; sudo systemctl enable ly.service -f ; echo 'Ly is active - reboot now'"
alias togdm="sudo pacman -S gdm --noconfirm --needed ; sudo systemctl enable gdm.service -f ; echo 'Gdm is active - reboot now'"
alias tolxdm="sudo pacman -S lxdm --noconfirm --needed ; sudo systemctl enable lxdm.service -f ; echo 'Lxdm is active - reboot now'"

### Aliases for Software (Controll) ###
#ls (Quicker directory listing)
alias l='ls'
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -alFh'
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
## $EDITOR configuration settings
#Specifics for configuration files
alias nlxdm="          sudo $EDITOR /etc/lxdm/lxdm.conf"
alias nlightdm="       sudo $EDITOR /etc/lightdm/lightdm.conf"
alias npacman="        sudo $EDITOR /etc/pacman.conf"
alias ngrub="          sudo $EDITOR /etc/default/grub"
alias nconfgrub="      sudo $EDITOR /boot/grub/grub.cfg"
alias nmkinitcpio="    sudo $EDITOR /etc/mkinitcpio.conf"
alias nmirrorlist="    sudo $EDITOR /etc/pacman.d/mirrorlist"
alias narcomirrorlist="sudo $EDITOR /etc/pacman.d/arcolinux-mirrorlist"
alias nsddm="          sudo $EDITOR /etc/sddm.conf"
alias nsddmk="         sudo $EDITOR /etc/sddm.conf.d/kde_settings.conf"
alias nfstab="         sudo $EDITOR /etc/fstab"
alias nnsswitch="      sudo $EDITOR /etc/nsswitch.conf"
alias nsamba="         sudo $EDITOR /etc/samba/smb.conf"
alias ngnupgconf="     sudo $EDITOR /etc/pacman.d/gnupg/gpg.conf"
alias nhosts="         sudo $EDITOR /etc/hosts"
alias nhostname="      sudo $EDITOR /etc/hostname"
alias nresolv="        sudo $EDITOR /etc/resolv.conf"
alias nb="                  $EDITOR ~/.bashrc"
alias nz="                  $EDITOR ~/.zshrc"
alias nf="                  $EDITOR ~/.config/fish/config.fish"
alias nneofetch="           $EDITOR ~/.config/neofetch/config.conf"
alias nplymouth="      sudo $EDITOR /etc/plymouth/plymouthd.conf"
alias nvconsole="      sudo $EDITOR /etc/vconsole.conf"

### Aliases for System Information ###
## Check Stuff
alias checkhw="hwinfo --short"                                   #check hardware (short summary)
alias checklog="journalctl -p 3 -xb"                             #check logs
alias checkaudio="pactl info | grep 'Server Name'"               #check audio (pulseaudio or pipewire)
alias checkcpu="cpuid -i | grep uarch | head -n 1"               #check cpu
alias checkmc='grep . /sys/devices/system/cpu/vulnerabilities/*' #check microcode vulnerabilities
## List Stuff
# EXTENDED USAGE: pacman -S --needed - < my-list-of-packages.txt # Install packages from a list
alias list-users="cut -d: -f1 /etc/passwd | sort" # List of existing useres on the machine
alias list-packs="         sudo pacman -Qqe"               # List of explicitly installed packages
alias list-packs-explicit="sudo pacman -Qqet"              # List of explicitly installed packages without deps
alias list-packs-aur="     sudo pacman -Qqem"              # List of AUR packages
alias list-packs-size="expac -H M '%m\t%n' | sort -h | nl" # List of package sizes
function_depends()  { search=$(echo "$1"); sudo pacman -Sii $search | grep "Required" | sed -e "s/Required By     : //g" | sed -e "s/  /\n/g";}
alias list-packs-depends='function_depends'
alias list-session-xorg="   ls /usr/share/xsessions"        # List xorg    sessions
alias list-session-wayland="ls /usr/share/wayland-sessions" # List wayland sessions
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

### Aliases for software managment ###
#pacman
alias sps='   sudo pacman -S'     # install package
alias spr='   sudo pacman -R'     # remove  package
alias sprs='  sudo pacman -Rs'
alias sprdd=' sudo pacman -Rdd'
alias spqo='  sudo pacman -Qo'
alias spsii=' sudo pacman -Sii'
alias update='sudo pacman -Syyu'
#skip integrity check
alias paruskip='paru -S --mflags --skipinteg'
alias trizenskip='trizen -S --skipinteg'
alias yayskip='yay -S --mflags --skipinteg'
#cleanup packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # Cleanup orphaned packages
#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"
#our experimental - best option for the moment
alias mirrorx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias mirrorxx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias ram='rate-mirrors --allow-root --disable-comments arch | sudo tee /etc/pacman.d/mirrorlist'
alias rams='rate-mirrors --allow-root --disable-comments --protocol https arch  | sudo tee /etc/pacman.d/mirrorlist'
## gpg
#receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-keyserver="[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done'"
#verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias fix-gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"

### Aliases for Container management ###
#enabling vmware services
#alias start-vmware="sudo systemctl enable --now vmtoolsd.service"
#alias vmware-start="sudo systemctl enable --now vmtoolsd.service"
#alias sv="sudo systemctl enable --now vmtoolsd.service"
#mounting the folder Public for exchange between host and guest on virtualbox
#alias vbm="sudo /usr/local/bin/arcolinux-vbox-share"

### Aliases for fixes ###
## path related fixes (e.g. remove lock files)
#default shell configs
alias restore-default-bash='cp /etc/skel/.bashrc                  ~/.bashrc                  && exec bash'
alias restore-default-zsh=' cp /etc/skel/.zshrc                   ~/.zshrc                   && echo "Copied."'
alias restore-default-fish='cp /etc/skel/.config/fish/config.fish ~/.config/fish/config.fish && echo "Copied."'
#folder ownership
alias fix-permissions="sudo chown -R $USER:$USER ~/.config ~/.local"
#pamac unlock
alias pamac-unlock="sudo rm /var/tmp/pamac/dbs/db.lock"
#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"
#logout unlock (arcolinux logout)
alias rmlogoutlock="sudo rm /tmp/arcologout.lock"
## key related fixes
alias keyfix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias key-fix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias keys-fix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fixkey="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fixkeys="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-key="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-keys="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
## config related fixes
alias fix-sddm-config="/usr/local/bin/arcolinux-fix-sddm-config"
alias fix-pacman-conf="/usr/local/bin/arcolinux-fix-pacman-conf"
alias fix-pacman-keyserver="/usr/local/bin/arcolinux-fix-pacman-gpg-conf"
alias fix-grub="/usr/local/bin/arcolinux-fix-grub"
alias fixgrub="/usr/local/bin/arcolinux-fix-grub"
## application specific fixes
#git
alias rmgitcache="rm -r ~/.cache/git"
alias grh="git reset --hard"

### Aliases for Maintenace & File System ###
#maintenance
alias downgrad-arco="sudo downgrade --ala-url https://ant.seedhost.eu/arcolinux/"
#wayland aliases
alias wsimplescreen="wf-recorder -a"
alias wsimplescreenrecorder="wf-recorder -a -c h264_vaapi -C aac -d /dev/dri/renderD128 --file=recording.mp4"
#btrfs aliases
alias btrfsfs="sudo btrfs filesystem df /"
alias btrfsli="sudo btrfs su li / -t"
#snapper aliases
alias snapcroot="sudo snapper -c root create-config /"
alias snapchome="sudo snapper -c home create-config /home"
alias snapli="sudo snapper list"
alias snapcr="sudo snapper -c root create"
alias snapch="sudo snapper -c home create"
#Leftwm aliases
alias lti="leftwm-theme install"
alias ltu="leftwm-theme uninstall"
alias lta="leftwm-theme apply"
alias ltupd="leftwm-theme update"
alias ltupg="leftwm-theme upgrade"

#### Other ####
## arch linux rolling load personal config
# See: https://arcolinuxb.com/create-the-personal-folder-on-your-current-system-and-use-the-alias-personal/
alias personal='cp -Rf /personal/* ~'
# extend this config using personal config in '~/' named '.bashrc-personal' (not overwritten on skel restore)
[[ -f ~/.bashrc-personal ]] && . ~/.bashrc-personal

#### Terminal output ####
printDevider() {
  printf "\n"
  printf %"$COLUMNS"s  | tr " " "-"
}
# clear # Clear all previous text from terminal for a cleaner look (not always recommended)
if [[ $(tput lines) -ge 25 ]]; then # min term hight 25
  # terminal reporting tools
  neofetch --source ~/.config/neofetch/great-wave-transparent-2.png --size 400px
  #screenfetch
  #alsi
  #paleofetch
  #fetch
  #hfetch
  #sfetch
  #ufetch
  #ufetch-arco
  #pfetch
  #sysinfo
  #sysinfo-retro
  #cpufetch
  #colorscript random

  printDevider

  if [[ $(tput lines) -ge 50 ]]; then # min term hight 50

    # List IP information:
    #echo   "Local  IPv4-Address: $(ip -4 addr | grep global | sed -e's/^.*inet \([^ ]*\)\/.*$/\1/;t;d' | head -1)"
    #echo   "Global IPv4-Address: $(dig    TXT +short ch whoami.cloudflare @1.0.0.1           | sed 's/"//g')"
    #printf "Global IPv6-Address: $(ip -6 addr | grep global | sed -e's/^.*inet6 \([^ ]*\)\/.*$/\1/;t;d'  | head -1)"
    #printf "Global IPv6-Address: $(dig -6 TXT +short o-o.myaddr.l.google.com @ns1.google.com | sed 's/"//g')"
	#printDevider

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
