{ self, inputs, ... }:
{
  flake.nixosModules.aether-config =
    { lib, pkgs, ... }:

    {
      # Kernel
      boot = {
        kernelPackages = pkgs.linuxPackages_latest;
        kernelModules = [
          # Sensors/controls on ASUS ROG Strix B550-I motherboard
          "jc24"
          "nct6775"
          # Required for Endfield, https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/wiki/Anime-Games#arknights-endfield-linux
          "ntsync"
        ];
      };

      # Bootloader
      boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };

      # Networking
      networking = {
        hostName = "aether";
        networkmanager.enable = true;
      };

      # Sound
      services.pulseaudio.enable = false;
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

      # Bluetooth
      hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
      };

      # Printing
      services.printing.enable = true;

      # Security
      security.polkit.enable = true;
      security.pam.services.swaylock = { };

      # Enable nix-command, flakes
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      # Path
      environment.pathsToLink = [
        "/share/zsh" # Autocompletion for system packages, see https://home-manager-options.extranix.com/?query=zsh.enablecompletion&release=master
        "/share/applications"
        "/share/xdg-desktop-portal"
      ];

      # Locale
      time.timeZone = "Europe/Berlin";
      i18n = {
        defaultLocale = "en_US.UTF-8";
        extraLocaleSettings = {
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
      };
      console.keyMap = "de";

      # Default shell
      users.defaultUserShell = pkgs.zsh;
      programs.zsh.enable = true;

      # User
      users.users.maid = {
        isNormalUser = true;
        description = "maid";
        extraGroups = [
          "wheel"
          "networkmanager"
          "plugdev"
          "input"
          "gamemode"
        ];
        useDefaultShell = true;
      };

      # This value determines the NixOS release from which the default
      # settings for stateful data, like file locations and database versions
      # on your system were taken. It‘s perfectly fine and recommended to leave
      # this value at the release version of the first install of this system.
      # Before changing this value read the documentation for this option
      # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
      system.stateVersion = "25.05"; # Did you read the comment?
    };
}
