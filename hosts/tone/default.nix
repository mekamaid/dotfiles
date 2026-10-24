{ self, inputs, ... }:

let
  system = "x86_64-linux";

  configRevision = {
    system.configurationRevision = self.rev or self.dirtyRev or null;
  };
in
{
  flake.nixosConfigurations.tone = inputs.nixpkgs.lib.nixosSystem {
    system = system;

    pkgs = import inputs.nixpkgs {
      system = system;
      config.allowUnfree = true;
      overlays = [
        inputs.nix-vscode-extensions.overlays.default
        inputs.helium.overlays.default
      ];
    };

    specialArgs = { inherit inputs; };

    modules = [
      self.nixosModules.tone-config
      self.nixosModules.nvidia
      self.nixosModules.niri
      self.nixosModules.fonts
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit inputs; };
          backupFileExtension = "home-manager-backup";
          users.maid = import ../../home/maid;
        };
      }
      configRevision
    ];
  };
}
