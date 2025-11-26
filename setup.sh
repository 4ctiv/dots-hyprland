#!/bin/bash

if [[ ! -f "$(which paru)" ]]; then
  sudo acman -Syu && sudo pacman -S --needed base-devel git
  git clone https://aur.archlinux.org/paru.git paru && cd paru && makepkg -si && cd .. && (yes | rm -r paru) || exit 1
fi

paru -Sy && paru -S --needed timeshift &&\
sudo timeshift --create --yes --comments "$(date %Y-%m-%d %H:%M:%S) pre install" --tags D

echo "Installing Software"
to_install=""
while read -r row; do
  if [[ -z "$(echo "${row}" | grep -v "^#")" ]];then
    continue;
  else
    echo "${row}"
    to_install="${to_install} $(echo "${row}" | sed 's/#.*$//g')"
  fi
done < requirements.txt
echo "$to_instally"
paru -Syu --needed $to_install $@ || \
  (echo "[ERROR] Package installation failed!"; exit 1) || exit $?


echo "Deploying config files ..."
cp -r ./.config "$HOME" &&\
cp -r ./.icons  "$HOME" &&\
cp -r ./.local  "$HOME" &&\
cp -r ./.themes "$HOME" &&\
cp -r ./.vim    "$HOME" &&\
cp    ./.vimrc  "$HOME" &&\
cp    ./.gtkr   "$HOME" &&\
cp ./.gtkrc-2.0 "$HOME" &&\
cp ./.profile   "$HOME" &&\
sudo cp ./etc/systemd/system/wol.service /etc/systemd/system/wol.service || \
  (echo "[ERROR] Config file deployment failed!"; exit 1)
# Fix faulty permissions of config files
sudo chown -R "$USER:$USER" "$HOME/{.config,.icons,.local,.themes,.vimrc,.gtkr,.gtkrc-2.0,.profile}" &&\
sudo chmod -R 755 "$HOME/{.config,.icons,.local,.themes,.vimrc,.gtkr,.gtkrc-2.0,.profile}" ||\
  (echo "[ERROR] Config file ownership & permissions failed!"; exit 1)

echo "Setup defaults ..."
# Set default shell to fish if installed (should be)
[[ -f "$(which fish)" ]] && sudo chsh -s "$(which fish)" "$USER"
[[ -f "$(which openrgb)" ]] && sudo modprobe i2c-dev
# Setup default applications
[[ -f "$(which code)" ]]      &&  xdg-mime default code.desktop application/octet-stream # unknown extension
[[ -f "$(which kitty)" ]]     &&  gsettings set org.gnome.desktop.default-applications.terminal exec kitty
[[ -f "$(which nemo)" ]]      &&  xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
[[ -f "$(which inkscape)" ]]  &&  xdg-mime default inkscape.desktop image/svg+xml         # svg
[[ -f "$(which gimp)" ]]      &&  xdg-mime default gimp.desktop image/png                 # png
[[ -f "$(which papers)" ]]    &&  xdg-mime default papers.desktop application/pdf         # pdf
[[ -f "$(which shotcut)" ]]   &&  xdg-mime default shotcut.desktop video/mp4              # mp4
[[ -f "$(which handbrake)" ]] &&  xdg-mime default handbrake.ghb.desktop video/x-matroska # mkv
# Setup nemo
[[ -f "$(which nemo)" ]] &&\
  gsettings set org.cinnamon.desktop.default-applications.terminal exec kitty &&\
  gsettings set org.cinnamon.desktop.default-applications.terminal exec-arg fish
# Setup sddm theme
[[ -f "/lib/sddm/sddm.conf.d/default.conf"]] && \
  sddm_theme_folder="$(cat /lib/sddm/sddm.conf.d/default.conf | awk '/ThemeDir=/{split($0,a,"="); print a[2]}')"
  [[ -d "${sddm_theme_folder:?sddm theme not set}/catppuccin-mocha" ]] && \
    sudo sed -i -e "s@Current=.*@Current=\"${sddm_theme_folder:?sddm theme not set}/catppuccin-mocha\"@" /lib/sddm/sddm.conf.d/default.conf
# Setup grub theme
[[ -f "/etc/default/grub" ]] && [[ -f "/usr/share/grub/themes/catppuccin-mocha/theme.txt" ]] &&\
  sudo sed -s -i 's@^[ #]*GRUB_THEME=.*@GRUB_THEME="/usr/share/grub/themes/catppuccin-mocha/theme.txt"@' /etc/default/grub
# Setup virt-manager
# sudo usermod -a -G libvirt $(whoami) # DANGEROUS: User gains some higher privileges on the system
# Setup Snap support (allow classic mode)
[[ -d "/var/lib/snap" ]] && sudo ln -s /var/lib/snapd/snap /snap

echo "Setup systemd services ..."
sudo systemctl enable --now clamav-daemon.service &&\
sudo systemctl enable --now clamav-freshclam-once.service &&\
sudo systemctl enable --now libvirtd.service &&\
sudo systemctl enable --now snapd &&\
sudo systemctl enable       sddm.service ||\
  (echo "[ERROR] Starting systemd system services failed!"; exit 1)
systemctl enable --now --user ssh-agent.service &&\
systemctl enable --now --user hypridle.service &&\
systemctl enable --now --user hyprpaper.service &&\
systemctl enable --now --user hyprsunset.service &&\
systemctl enable --now --user docker.service ||\
  (echo "[ERROR] Starting systemd user services failed!"; exit 1)

echo "Setup themes ..."
if [[ -d "/usr/share/themes/catppuccin-mocha" ]]; then
  if [[ -f '/etc/sddm.conf' ]]; then
    sudo sed -i -e 's@^[ ]*Current=.*$@Current=catppuccin-mocha@m' /etc/sddm.conf || \
      sed -i -e 's@^\[Theme\]\nCurrent=.*$@Current=catppuccin-mocha@m' /etc/sddm.conf || \
      (echo "[THEME]\nCurrent=catppuccin-mocha" | sudo tee -a '/etc/sddm.conf') ||\
      (echo "[ERROR] Setting sddm theme failed!")
  else
    sudo sed -i -e 's@^[ ]*Current=.*$@Current="catppuccin-mocha"@m' /usr/lib/sddm/sddm.conf.d/default.conf || \
      (echo "[ERROR] Setting sddm theme failed!")
  fi
fi
if [[ -f "/etc/default/grub" ]] && [[ -d /usr/share/grub/themes/catppuccin-mocha ]] ; then
  sudo sed -i -e 's@^[ ]*GRUB_THEME=.*$@GRUB_THEME="/usr/share/grub/themes/catppuccin-mocha/theme.txt"@m' /etc/default/grub &&\
  sudo os-prober &&\
  sudo grub-mkconfig -o /boot/grub/grub.cfg || \
  (echo "[ERROR] Setting grub2 theme failed!")
fi

echo "Reloading Hyprland ..."
hyprctl reload

echo "Creating snapshot ..."
sudo timeshift --create --yes --comments "$(date %Y-%m-%d %H:%M:%S) install finished" --tags D

echo "Setup finished successfully,\n A restart is recommended"
notify-send "setup" "Setup finished successfully,\n A restart is recommended"

systemctl start sddm.service

exit 0

