#!/bin/bash

paru -Sy && paru -S --needed timeshift &&\
sudo timeshift --create --yes --comments "$(date %Y-%m-%d %H:%M:%S) pre install" --tags D

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
  (echo "[ERROR] Package installation failed!"; exit 1)


# Deploy config files
sudo cp -r ./.config $HOME &&\
sudo cp -r ./.icons  $HOME &&\
sudo cp -r ./.local  $HOME &&\
sudo cp -r ./.themes $HOME &&\
sudo cp    ./.vimrc  $HOME &&\
sudo cp    ./.gtkr   $HOME &&\
sudo cp ./.gtkrc-2.0 $HOME &&\
sudo cp ./.profile   $HOME &&\
sudo cp ./etc/systemd/system/wol.service /etc/systemd/system/wol.service || \
  (echo "[ERROR] Config file deployment failed!"; exit 1)


# Setup systemd services
sudo systemctl enable --now clamav-daemon.service \
                            clamav-freshclam-once.service \
                            wol.service &&\
                            polkit || \
  (echo "[ERROR] Starting systemd system services failed!"; exit 1)

sudo systemctl enable --now --user \
                            ssh-agent.service \
                            hypridle.service \
                            hyprpaper.service \
                            hyprsunset.service \
                            xdg-desktop-portal-hyprland.service &&\
                            docker || \
  (echo "[ERROR] Starting user services failed!"; exit 1)

# Setup themes
if [[ -d "/usr/share/themes/catppuccin-mocha" ]]; then
  sudo sed -i -e 's@^[ ]*Current=.*$@Current="catppuccin-mocha"@m' /lib/sddm/sddm.conf.d/default.conf || \
  (echo "[ERROR] Setting sddm theme failed!")
fi

if [[ -f "/etc/default/grub" ]] && [[ -d /usr/share/grub/themes/catppuccin-mocha ]] ; then
  sudo sed -i -e 's@^[ ]*GRUB_THEME=.*$@GRUB_THEME="/usr/share/grub/themes/catppuccin-mocha/theme.txt"@m' /etc/default/gruba &&\
  grub-mkconfig -o /boot/grub/grub.cfg || \
  (echo "[ERROR] Setting grub2 theme failed!")
fi

hyprctl reload

sudo timeshift --create --yes --comments "$(date %Y-%m-%d %H:%M:%S) install finished" --tags D

echo "Setup finished successfully"
exit 0
