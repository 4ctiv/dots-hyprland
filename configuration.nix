# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # EFI Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Grub
  #boot.loader.grub = {
  #  enable = true;
  #  device = "/boot";
  #  efiSupport = true;
  #  useOSProber = true;  
  #};


 # Network
  networking.hostName = "atlas"; # Define your hostname.
 #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "de";
    xkbVariant = "";
    enable = true;
    displayManager.sddm.enable = true;
  };

  # Configure console keymap
  console.keyMap = "de";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowInsecure = true;
  #nixpkgs.config.PermittedInsecurePackages = [
  #  "python-2.7.18.6"
  #]  

  # Fix #!/bin/bash
#  system.activationScripts.binbash = {
#    deps = [ "binsh" ];
#    text = ''
#      ln -s /bin/sh /bin/bash
#    '';
#  };

  programs.hyprland = {
    enable = true;
  };

#  programs.hyprlock.enable = {
#    enable = true;
#  };

  programs.hyprland.xwayland = {
    hidpi = true;
    enable = true;
  };

  programs.fish.enable = true;

  services.printing = {
    enable = false;
    drivers = [pkgs.epson-escpr];
     browsing = true;
     defaultShared = true;
  };

  services.blueman.enable = true;
  services.gnome.gnome-keyring.enable = true;

  # Sound
  sound.enable = true;
  
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  hardware = {
    bluetooth.enable = true;
  };
  
  # Touchpad support
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.activ = {
    isNormalUser = true;
    description = "Leif G.";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      # MEDIA
      obs-studio
     #obs-studio-plugins.obs-ndi
      obs-studio-plugins.wlrobs
      obs-studio-plugins.obs-pipewire-audio-capture
      obs-studio-plugins.obs-backgroundremoval
      obs-studio-plugins.droidcam-obs
      # COMMUNICATION Audi/Video
      discord
      element
      # COMMUNICATION chat only
      #ferdium
      signal-desktop
      telegram-desktop
      whatsapp-for-linux  
    ];
  };

  #environment.etc = {
  #  "xdg/gtk-3.0" .source = ./gtk-3.0
  #}

  #environment = {
  #  variables = {
  #    QT_QPA_PLATFORMTHEME = "qt5ct";
  #    QT_QPA_PLATFORM = "xcb obs";
  #  }
  #}

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

    # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  # BASIC
  # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  kitty
  fish
  nano
  curl
  git
 #gksudo

  # Hyprland
  wofi
  waybar
  cliphist
  blueman
  
  # TOOLS terminal
  htop
  gtop
  powertop
  tree
  neofetch

  # TOOLS gui
  xfce.thunar
  networkmanagerapplet
  quickemu
  quickgui
  nerdfonts
  noto-fonts-emoji-blob-bin

  # WEBBROWSER
  brave
  firefox
  google-chrome
 #microsoft-edge
  
  # THEMES
  hyprpaper
  hypr
  catppuccin-gtk
  catppuccin-kvantum
  catppuccin-cursors

  # MEDIA
  obs-studio
  noisetorch
    
  # PRODUCTIVITY
  nextcloud-client
  xournalpp
  obsidian    
  onlyoffice-bin
  pdfmixtool

  # DEV tools
  vscode
 #vscode-extensions.catppuccin.catppuccin-vsc
 #jetbrains.idea-ultimate
  jetbrains.idea-community

  # DEV language support
  #xampp  # Does not jet exist
  python3
  jdk
  go  
  lua
  rustc
  
  # DEV package manager
  pipx
  cargo
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

