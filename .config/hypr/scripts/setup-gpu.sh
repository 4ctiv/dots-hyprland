#!/bin/bash

match "$(lspci | grep -E "VGA|3D" | tr '[:upper:]' '[:lower:]' | grep -o -E "amd|intel|nvidia")"
  case "intel")
    sudo pacman -S --needed libva mesa lib32-mesa vulkan-intel  lib32-vulkan-intel  intel-media-driver
    ;;
  case "amd")
    sudo pacman -S --needed libva mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon
    ;;
  case "nvidia")
    sudo pacman -R libdrm nvidia-open nvidia-open-lts nvidia-beta nvidia-settings nvidia-utils egl-wayland
    sudo pacman -S --needed libva mesa lib32-mesa vulkan-noveau lib32-vulkan-noveau
    # Propriatary
    sudo pacman -S --needed nvidia-utils lib32-nvidia-utils

    # Add kernel parameter (May be required)
    # # Check that noveau is not blacklisted
    # echo 'nouveau.config=NvGspRm=1' | sudo tee noveau_config_custom
    ;;
  case *)
    echo "Unknown GPU vendor"
    lspci | grep -E "VGA|3D"
    ;;
esac

# sudo pacman -S openrgb # RGP controll
sudo pacman -S --needed nvtop vulkan-tools && vulkaninfo | grep -A 2 -e "^GPU[ ]*id[ ]*:"

 # modinfo -p video # <- Show loaded video modules
