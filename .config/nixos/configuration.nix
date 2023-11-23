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
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;
  services.xserver.windowManager.awesome.enable = true;


# XDG portal
  xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

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

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #command line stuff
    pkgs.wget #A command line tool for downloading things from the internet
    pkgs.git #A distributed version control system
    pkgs.btop #A tool for monitoring system information
    pkgs.hyfetch #A replacement for neofetch adds pride flags and maintained neowofetch
    pkgs.exa #A replacement for ls written in rust
    pkgs.fd #A replacement for find written in rust
    pkgs.ripgrep #A replacement for grep also written in rust
    pkgs.clang
    pkgs.pandoc #A tool for converting files written in Haskell
    pkgs.gnuplot #A tool for ploting graphs

    #shells
    pkgs.home-manager
    pkgs.pkgs.zsh
    pkgs.zsh-syntax-highlighting
    pkgs.fish #the Friendly Interactive SHell: Finally a shell for the 90's
    pkgs.oh-my-fish

    #Terminal Emulators
    pkgs.kitty #A GPU accelerated terminal editor with tabs
    pkgs.kitty-themes
    pkgs.alacritty #A GPU accelerated terminal editor written in rust

    #Text Editors
    pkgs.neovim #A mid fall back editor
    pkgs.emacs #The greatest editor of all times
    pkgs.micro #An excellent fall back editor

    #Internet
    pkgs.brave
    pkgs.firefox
    pkgs.zoom-us

    #Productivity
    pkgs.mpv
    pkgs.libreoffice #The best libre office suite
    pkgs.cura
    #rustdesk

    #Gaming
    pkgs.steam
    pkgs.discord
    pkgs.element-desktop

    #Window Manager stuff
    pkgs.sddm
    pkgs.hyprland
    pkgs.wofi
    pkgs.awesome
    pkgs.dmenu
    pkgs.nitrogen #A tool for setting wallpaper's on X11
    pkgs.cinnamon.nemo #A good GUI file-manager
    pkgs.arandr
    pkgs.lxappearance #A tool for setting themes

    #Fonts
    pkgs.jetbrains-mono
    pkgs.overpass
    pkgs.source-sans-pro
    pkgs.julia-mono
    pkgs.iosevka

    #Utils
    pkgs.cmake
    pkgs.hunspell
    pkgs.enchant #A library for interacting with different spell checking back ends

    #Languages
    pkgs.go
    pkgs.gopls
    pkgs.kotlin
    pkgs.kotlin-language-server
    pkgs.python
    pkgs.lua
    pkgs.lua-language-server
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
