{ lib, pkgs, ... }:

let
  inherit (pkgs) stdenv;
in
{
  programs.ghostty = {
    enable = true;
    # Use ghostty-bin on darwin since ghostty is not available
    package = lib.mkIf stdenv.hostPlatform.isDarwin pkgs.ghostty-bin;

    # Enable systemd user service on Linux
    systemd.enable = lib.mkIf stdenv.hostPlatform.isLinux true;
    enableZshIntegration = true;
    settings = {
      window-width = lib.mkIf stdenv.hostPlatform.isDarwin 120;
      window-height = lib.mkIf stdenv.hostPlatform.isDarwin 35;
      window-decoration = if stdenv.hostPlatform.isLinux then "none" else "auto";
      window-padding-color = "background";

      font-family = "Google Sans Code";
      font-size = if stdenv.hostPlatform.isDarwin then 14 else 12;
      font-feature = "-liga, -calt, -dlig";

      theme = "Vesper";

      # Disable mouse capture with shift (enable clickable hyperlinks in e.g. tmux with shift+cmd)
      mouse-shift-capture = "never";
    };
  };
}
