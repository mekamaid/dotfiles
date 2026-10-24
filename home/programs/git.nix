{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "mekamaid";
        email = "me@maid.dev";
      };
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };

    signing = {
      format = "ssh";
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPGjooEn/yj4qIGy7zeCe/WvdG2ucFSKSad0f9EJz05c";
      signer =
        if pkgs.stdenv.hostPlatform.isDarwin then
          "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
        else
          "${pkgs._1password-gui}/bin/op-ssh-sign";
      signByDefault = true;
    };

    # TODO find a way to add .gitconfig_uni to config as a secret
    includes = [
      {
        condition = "gitdir:~/dev/uni/";
        path = "~/dev/uni/.gitconfig_uni";
      }
      {
        condition = "gitdir:~/Developer/uni/";
        path = "~/dev/uni/.gitconfig_uni";
      }
    ];

    ignores = [
      ".DS_Store"
    ];
  };
}
