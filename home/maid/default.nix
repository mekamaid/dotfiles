{
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    (inputs.import-tree [ ../programs ])
  ];

  # User
  home = {
    username = "maid";
    homeDirectory = "/home/maid";
  };

  # Environment variables
  home.sessionVariables = {
    EDITOR = "nano";
  };

  # GTK dark mode
  dconf.settings = lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
    "org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };

  # Packages
  home.packages = with pkgs; [
    # dev stuff
    libgccjit
    cmake
    jdk25
    python3
    nixfmt
    sqlite

    # cmdline utilities
    nano
    tree
    ani-cli
    curl
    doxygen
    ffmpeg_8
    imagemagick
    stow
    cloc
    nurl
    nix-output-monitor
    nix-init
    nvtopPackages.nvidia
    networkmanagerapplet

    # desktop apps
    helium
    kdePackages.dolphin
    discord
    signal-desktop
    cider-2
    qbittorrent
    filezilla
    gimp
    pavucontrol

    # games
    xivlauncher
    prismlauncher
    heroic
    mangohud
    protonplus
  ];

  # Programs
  programs = {
    tmux.enable = true;
    lf.enable = true;
    yazi.enable = true;
    fzf.enable = true;
    aria2.enable = true;
    bat.enable = true;
    btop.enable = true;
    gpg.enable = true;
    grep.enable = true;
    ripgrep.enable = true;
    obsidian.enable = true;
    obs-studio.enable = true;
    mpv.enable = true;
    fuzzel.enable = true;
    waybar.enable = true;
    swaylock.enable = true;
  };

  # Services
  services = {
    dunst.enable = true;
    arrpc.enable = true;
  };

  # Enable Home Manager
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";
}
