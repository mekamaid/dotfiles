{ ... }:

{
  wayland.windowManager.niri = {
    enable = true;
    checkConfig = true;
  };

  # TODO switch to wayland.windowManager.niri.settings
  xdg.configFile."niri/config.kdl".source = ../../etc/config/niri/config.kdl;
}
