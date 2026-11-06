{ lib, ... }:

{
  # TODO configure prompt
  programs.starship = {
    enable = true;

    enableZshIntegration = true;
    settings = lib.importTOML ./../../etc/config/starship/starship-config.toml;
  };
}
