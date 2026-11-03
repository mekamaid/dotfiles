{ self, inputs, ... }:
{
  flake.nixosModules.monitor =
    { pkgs, ... }:

    {
      # Enable changing monitor settings via ddcutil
      environment.systemPackages = with pkgs; [
        ddcutil
      ];

      # ddcutil requires I2C
      hardware.i2c.enable = true;
    };
}
