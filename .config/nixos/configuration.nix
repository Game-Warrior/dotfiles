# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  # boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable The Window Manager 
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;
  services.xserver.windowManager.awesome.enable = true;

environment.sessionVariables = {
  # If your cursor becomes invisible
  WLR_NO_HARDWARE_CURSORS = "1";
  # Hint electron apps to use wayland
  NIXOS_OZONE_WL = "1";
};

hardware = {
    # Opengl
    opengl.enable = true;

    # Most wayland compositors need this
    nvidia.modesetting.enable = true;
};

  # waybar
    (pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    })
    )

# XDG portal
  xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Enable sound with pipewire.
    sound.enable = true;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

  # rofi keybind
    bind = $mainMod, r, exec, rofi -show drun -show-icons

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Set the Default Users Shell
   #users.defaultUserShell - pkgs.fish;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gb = {
    isNormalUser = true;
    description = "gb";
    extraGroups = [ "networkmanager" "wheel" "kvm" "libvirt"];
    packages = with pkgs; [
      firefox
    #  thunderbird
    ];
  };

  # Enable automatic login for the user.
  #services.xserver.displayManager.autoLogin.enable = true;
  #services.xserver.displayManager.autoLogin.user = "gb";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #Doom Emacs with native complilation support
  nixpkgs.overlays = [
  (import (builtins.fetchTarball https://github.com/nix-community/emacs-overlay/archive/master.tar.gz))
];
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #command line stuff
    wget
    git
    btop
    neofetch
    exa
    starship
    fd
    ripgrep
    clang
    pandoc
    gnuplot

    #shells
    home-manager
    zsh
    pkgs.zsh-syntax-highlighting
    fish
    oh-my-fish

    #Terminal Emulators
    kitty
    kitty-themes
    alacritty

    #Text Editors
    neovim
    {
      emacsWithPackages = (pkgs.emacsPackagesGen pkgs.emacsGcc).emacsWithPackages (epkgs: ([epkgs.vterm]));
    }
    micro

    #Internet
    brave
    firefox
    zoom-us

    #Productivity
    mpv
    libreoffice
    cura
    #rustdesk

    #Gaming
    steam 
    discord
    element-desktop
    
    #Window Manager stuff
    sddm
    hyprland
    wofi
    awesome
    dmenu
    nitrogen
    cinnamon.nemo
    arandr
    lxappearance

    #Fonts
    jetbrains-mono
    overpass
    source-sans-pro
    julia-mono
    iosevka

    #Utils
    cmake
    hunspell

    #Languages
    go
    gopls
    kotlin
    kotlin-language-server
    python
    lua
    lua-language-server

    #Desktop Environments
    cinnamon.cinnamon-common
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

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
