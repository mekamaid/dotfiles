{ lib, ... }:

{
  # TODO configure prompt
  programs.starship = {
    enable = true;

    enableZshIntegration = true;
    settings = lib.importTOML ./../../config/starship/starship-config.toml;
  };
}
