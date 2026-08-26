require("hyprland-var")

hl.on("hyprland.start", function()
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme \"prefer-dark\"")
    -- Services
    hl.exec_cmd("systemctl start --user xdg-desktop-portal-hyprland.service")
    hl.exec_cmd("systemctl start --user xdg-desktop-portal-gtk.service")
    hl.exec_cmd("systemctl start --user xdg-desktop-portal.service")
    hl.exec_cmd("systemctl start --user gnome-keyring-daemon.socket")
    hl.exec_cmd("systemctl start --user hyprsunset.service")
    hl.exec_cmd("systemctl start --user hyprpaper.service")
    hl.exec_cmd("systemctl start --user hypridle.service")
    hl.exec_cmd("systemctl start --user ssh-agent.service")
    hl.exec_cmd("systemctl start --user gpg-agent.service")
    hl.exec_cmd("systemctl start --user pipewire.service")
    hl.exec_cmd("systemctl start --user waybar.service")
    hl.exec_cmd("systemctl start --user mako.service")
    -- Clipboard
    hl.exec_cmd("wl-paste --type text  --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("cliphist wipe")
    hl.exec_cmd(scriptsDir .. "/fix_clipboard_xwayland.sh")
    -- Initial State
    hl.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ 1")
    hl.exec_cmd("bluetoothctl power off")
    -- system tray
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("openrgb --startminimized")
    hl.exec_cmd("keepassxc --minimized")
    -- apps
    hl.exec_cmd("thunderbird", { workspace = "name:mail silent" })
    hl.exec_cmd("cinny", { workspace = "name:chat silent" })
    hl.exec_cmd(scriptsDir .. "/autostart_desktop.sh")
    hl.exec_cmd(scriptsDir .. "/auto-upgrade")
end)

