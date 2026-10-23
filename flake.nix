{
  description = "valerie mekamaid's nix flake";

  inputs = {
    # nixpkgs
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    # flake-parts for flake structure
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };

    # import-tree for easier module imports
    import-tree = {
      url = "github:denful/import-tree";
    };

    # Home Manager for userspace config
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nix-darwin for macOS configuration
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nix-homebrew for managing homebrew installations on macOS
    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew";
    };

    # mac-app-util for Nix apps on macOS
    mac-app-util = {
      url = "github:hraban/mac-app-util";
    };

    # nixpkgs overlay for VSCode extensions
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
    };

    # Nix packaging for Helium browser while the nixpkgs one is WIP
    helium = {
      url = "github:schembriaiden/helium-browser-nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
