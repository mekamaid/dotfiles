{ ... }:

{
  # TODO configure default values
  programs.ssh = {
    enable = true;

    matchBlocks."*" = {
      identityAgent = "~/.1password/agent.sock";
    };
  };
}
