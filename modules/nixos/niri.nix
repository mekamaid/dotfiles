{ self, inputs, ... }:
{
  flake.nixosModules.niri =
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
        # sddm = {
        #   enable = true;
        #   wayland.enable = true;
        # };

        ly.enable = true;

        sessionPackages = [
          pkgs.niri
        ];
      };

      programs.niri = {
        enable = true;
        package = pkgs.niri;
      };

      programs.xwayland = {
        enable = true;
      };
    };
}
