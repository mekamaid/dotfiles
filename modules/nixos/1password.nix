{ self, inputs, ... }:
{
  flake.nixosModules._1password =
    { ... }:

    {
      programs = {
        _1password.enable = true;

        _1password-gui = {
          enable = true;

          # Certain features, including CLI integration and system authentication support,
          # require enabling PolKit integration on some desktop environments (e.g. Plasma).
          polkitPolicyOwners = [ "maid" ];
        };
      };

      # environment.etc = {
      #   # Maybe broken for Helium, see https://wiki.nixos.org/wiki/1Password#Unlocking_browser_extensions
      #   "1password/custom_allowed_browsers" = {
      #     text = ''
      #       helium
      #       chrome
      #     '';
      #     mode = "0755";
      #   };
      # };
    };
}
