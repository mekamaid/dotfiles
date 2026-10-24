{ ... }:

{
  programs.hyfetch = {
    enable = true;

    # TODO customize
    settings = {
      preset = "lesbian";
      mode = "rgb";
      auto_detect_light_dark = true;
      light_dark = "dark";
      lightness = 0.65;
      color_align = {
        mode = "horizontal";
      };
      backend = "fastfetch";
      args = null;
      distro = null;
      pride_month_disable = false;
      custom_ascii_path = null;
      custom_presets = null;
      palette_glyph = null;
      palette_type = null;
    };
  };

  # Backend for hyfetch
  programs.fastfetch.enable = true;
}
