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

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "maid";
  home.homeDirectory = "/home/maid";

  home.sessionVariables = {
    EDITOR = "nano";
  };

  # GTK dark mode
  dconf.settings = {
    "org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # dev stuff
    libgccjit
    cmake
    jdk25
    python3
    nixfmt
    alejandra
    sqlite

    # commandline utilities
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
    ungoogled-chromium
    discord
    signal-desktop
    cider-2
    qbittorrent
    filezilla
    gimp
    pavucontrol

    # games
    mangohud
    xivlauncher
    prismlauncher
    heroic
    protonplus
  ];

  # TODO configure default values
  programs.ssh = {
    enable = true;

    matchBlocks."*" = {
      identityAgent = "~/.1password/agent.sock";
    };
  };

  programs.lazygit = {
    enable = true;

    enableZshIntegration = true;
  };

  programs.tmux = {
    enable = true;
  };

  programs.lf = {
    enable = true;
  };

  programs.yazi = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
  };

  programs.aria2 = {
    enable = true;
  };

  programs.bat = {
    enable = true;
  };

  programs.btop = {
    enable = true;
  };

  programs.gpg = {
    enable = true;
  };

  programs.grep = {
    enable = true;
  };

  programs.ripgrep = {
    enable = true;
  };

  programs.obsidian = {
    enable = true;
  };

  programs.obs-studio = {
    enable = true;
  };

  programs.mpv = {
    enable = true;
  };

  services.arrpc = {
    enable = true;
  };

  programs.fuzzel.enable = true;

  # wayland.windowManager.niri = {
  #   enable = true;
  #   enableDefaultConfig = true;
  # };

  programs.waybar = {
    enable = true;
  };

  wayland.windowManager.niri = {
    enable = true;
    checkConfig = true;
  };

  xdg.configFile."niri/config.kdl".source = ../../config/niri/config.kdl;

  programs.swaylock = {
    enable = true;
  };

  services.dunst = {
    enable = true;
  };
}
