{ self, inputs, ... }:
{
  flake.nixosModules.gaming =
    { pkgs, ... }:

    {
      programs.steam = {
        enable = true;

        # Steam controller
        extraPackages = with pkgs; [ hidapi ];
        extest.enable = true;
      };

      # udev rules for Steam controller
      hardware.steam-hardware.enable = true;

      programs.gamescope.enable = true;

      programs.gamemode = {
        enable = true;

        settings = {
          custom = {
            start = "${pkgs.dunst}/bin/dunstify 'GameMode on'";
            end = "${pkgs.dunst}/bin/dunstify 'GameMode off'";
          };
        };
      };
    };
}
