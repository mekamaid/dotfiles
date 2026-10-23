{ ... }:

{
  # TODO configure zsh
  programs.zsh = {
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
      gr = "git reset";
      gcm = "git commit -m";
      gca = "git commit -a -m";
      gl = "git log --oneline --graph --all";
    };
  };
}
