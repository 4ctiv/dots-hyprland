function cleanup-packs --description 'alias to cleanup linux packages (native,snap,flatpak)'
    pacman -Scc && sudo pacman -Rns $(pacman -Qqtd) $argv
    pacman -Qdtq | sudo pacman -Rns - 2>/dev/null

    # Snap
    # CLOSE ALL SNAPS BEFORE RUNNING THIS
    for snapname in (snap list | tail -n +2 | awk '{print $1}')
        echo "Stopping $snapname..."
        sudo snap stop $snapname
    end
    for line in (snap list --all | grep disabled)
      set fields (string split -n ' ' $line)
      set snapname $fields[1]
      set revision $fields[3]
      sudo snap remove "$snapname" --revision="$revision"
    end
    # Flatpak
    sudo flatpak uninstall --unused # `--all` to delete all
    #sudo rm -rfv /var/tmp/flatpak-cache-* 2>/dev/null
end

function packs-cleanup --wraps 'cleanup-packs' --description 'alias for cleanup-packs'
  cleanup-packs $argv
end
