{ self, inputs, ... }:
{
  flake.nixosModules.desktop =
    { pkgs, ... }:

    {
      services.xserver = {
        enable = true;
        xkb = {
          layout = "de";
          variant = "";
        };
      };

      services.displayManager = {
        ly.enable = true;

        sessionPackages = [
          pkgs.niri
        ];
      };

      programs.niri.enable = true;

      programs.xwayland.enable = true;
    };
}
