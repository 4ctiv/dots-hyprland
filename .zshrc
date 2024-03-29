###
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
#installation via script from github
#export ZSH="/home/$USER/.oh-my-zsh"
#installation via paru -S oh-my-zsh-git
export ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# if you installed the package oh-my-zsh-powerline-theme-git then you type here "powerline" as zsh theme
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.

# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# ZSH_THEME_RANDOM_IGNORED=(pygmalion tjkirch_mod)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

if [ -f $ZSH/oh-my-zsh.sh ]; then
  source $ZSH/oh-my-zsh.sh
fi

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


####   ARCOLINUX SETTINGS   ####
export PAGER='most'

if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

setopt GLOB_DOTS
#share commands between terminal instances or not
unsetopt SHARE_HISTORY
#setopt SHARE_HISTORY

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

# Make nano the default editor

export EDITOR='nano'
export VISUAL='nano'

#PS1='[\u@\h \W]\$ '

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

### ALIASES ###

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

  #################################################
 ### Aliases for Input & Basic system settings ###
#################################################
#keyboard
alias give-me-qwerty-us="sudo localectl set-x11-keymap us"
alias give-me-qwerty-de="sudo localectl set-x11-keymap de"
#locale (language, keyboard)
alias setlocales="sudo localectl set-x11-keymap de && sudo localectl set-locale LANG=en_US.UTF-8"

  ######################################
 ### Aliases for Software (Controll) ###
#######################################
#ls (Quicker directory listing)
alias l='ls'
alias la='ls -la'
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

  ######################################
 ### Aliases for System Information ###
######################################
## Check Stuff
alias check-hw="hwinfo --short"                                   #check hardware (short summary)
alias check-log="journalctl -p 3 -xb"                             #check systemlogs
alias check-audio="pactl info | grep 'Server Name'"               #check audio (pulseaudio or pipewire)
alias check-cpu="cpuid -i | grep uarch | head -n 1"               #check cpu
alias check-mc='grep . /sys/devices/system/cpu/vulnerabilities/*' #check microcode vulnerabilities
## List Stuff
# EXTENDED USAGE: pacman -S --needed - < my-list-of-packages.txt # Install packages from a list
alias list-packs="         sudo pacman -Qqe"               # List of explicitly installed packages
alias list-packs-explicit="sudo pacman -Qqet"              # List of explicitly installed packages without deps
alias list-packs-aur="     sudo pacman -Qqem"              # List of AUR packages
alias list-packs-size="expac -H M '%m\t%n' | sort -h | nl" # List of package sizes
function_depends()  { search=$(echo "$1"); sudo pacman -Sii $search | grep "Required" | sed -e "s/Required By     : //g" | sed -e "s/  /\n/g";}
alias list-packs-depends='function_depends'
alias list-net-ipv4="nmap $(ip -4 addr list  | awk '/inet.*brd/ {print $2}' | head -1) -F --open -oG - | cut -d ' ' -f 2-3 | grep Ports:"
#Reading logs (bat)
alias log-calamares="bat /var/log/Calamares.log"
alias log-pacman="   bat /var/log/pacman.log"
alias log-xorg="     bat /var/log/Xorg.0.log"
alias log-xorg-old=" bat /var/log/Xorg.0.log.old"
#Recent Installed Packages
alias list-recent="    expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias list-recent-extended="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"
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
#skip integrity check (unsave !!!)
alias yayskip='yay -S --mflags --skipinteg'
#receive developer keys
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-keyserver="[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done'"
#verify signature for isos
alias check-gpg="gpg2 --keyserver-options auto-key-retrieve --verify"

  #########################
 ### Aliases for fixes ###
#########################
## package-manager fixes ##
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
## application specific fixes ##
#git
alias rmgitcache="rm -r ~/.cache/git"
alias grh="git reset --hard"

  ############################################
 ### Aliases for Maintenace & File System ###
############################################
#maintenance
alias downgrad-arco="sudo downgrade --ala-url https://ant.seedhost.eu/arcolinux/"
#btrfs aliases
alias list-btrfs-snapshots="sudo timeshift --list"
alias list-btrfs-filesystem="sudo btrfs filesystem df /"
alias list-btrfs-subvolumes="sudo btrfs su li / -t"
alias btrfs-compress="sudo btrfs defragment -r -v -czstd"
alias btrfs-balance="sudo btrfs balance start -dusage=66"
# Session info
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

neofetch --source ~/.config/neofetch/great-wave-transparent-2.png --size 400px
