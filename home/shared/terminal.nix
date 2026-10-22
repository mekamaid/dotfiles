{
  pkgs,
  lib,
  ...
}:

let
  inherit (pkgs) stdenv;
in
{
  programs = {
    # TODO configure zsh
    zsh = {
      enable = true;

      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      history = {
        size = 10000;
        ignoreAllDups = true;
        path = "$HOME/.zsh_history";
        ignorePatterns = [ "rm *" ];
      };

      shellAliases = {
        ls = "ls --color";
        ll = "ls -lah";
        c = "clear";

        gs = "git status -sb";
        gst = "git status";
        gaa = "git add .";
        gau = "git add -u";
        gap = "git add -p";
        gcm = "git commit -m";
        gca = "git commit -a -m";
        gl = "git log --oneline --graph --all";
      };
    };

    # TODO configure prompt
    starship = {
      enable = true;

      enableZshIntegration = true;
      settings = lib.importTOML ./../../config/starship/starship-config.toml;
    };

    ghostty = {
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
  };
}
