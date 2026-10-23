  #   outputs =
  #     {
  #       self,
  #       nixpkgs,
  #       home-manager,
  #       nix-darwin,
  #       nix-homebrew,
  #       mac-app-util,
  #       nix-vscode-extensions,
  #       ...
  #     }@inputs:
  #     let
  #       pkgsDarwin = import nixpkgs {
  #         system = "aarch64-darwin";
  #         config.allowUnfree = true;
  #         overlays = [
  #           nix-vscode-extensions.overlays.default
  #         ];
  #       };

  #       configRevision = {
  #         system.configurationRevision = self.rev or self.dirtyRev or null;
  #       };
  #     in
  #     {
  #       darwinConfigurations = {
  #         northstar = nix-darwin.lib.darwinSystem {
  #           system = "aarch64-darwin";
  #           pkgs = pkgsDarwin;
  #           specialArgs = { inherit inputs; };

  #           modules = [
  #             ./hosts/northstar/configuration.nix

  #             nix-homebrew.darwinModules.nix-homebrew
  #             {
  #               nix-homebrew = {
  #                 enable = true;
  #                 enableRosetta = true;
  #                 user = "alex";
  #                 autoMigrate = true;
  #               };
  #             }

  #             home-manager.darwinModules.home-manager
  #             {
  #               home-manager = {
  #                 useGlobalPkgs = true;
  #                 useUserPackages = true;
  #                 extraSpecialArgs = { inherit inputs; };
  #                 backupFileExtension = "home-manager-backup";
  #                 users.alex = import ./hosts/northstar/home.nix;
  #                 sharedModules = [
  #                   mac-app-util.homeManagerModules.default
  #                 ];
  #               };
  #             }

  #             mac-app-util.darwinModules.default

  #             configRevision
  #           ];
  #         };
  #       };
  #     };