{
  pkgs,
  config,
  ...
}: {
  services.dunst = {
    enable = true;
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
    settings = with config.colorScheme.palette; {
      global = {
        width = 220;
        height = 280;
        offset = "0x15";
        origin = "top-center";
        frame_color = "#${base0D}95";
        font = "sansSerif 10";
        corner_radius = 5;
        mouse_left_click = "close_current";
        mouse_right_click = "close_all";
        ellipsize = "middle";
        padding = 10;
        frame_width = 2;
        transparency = 10;
        progress_bar = true;
        progress_bar_frame_width = 0;
      };

      urgency_low = {
        background = "${base00}83";
        foreground = "${base07}";
        timeout = 5;
      };
      urgency_normal = {
        background = "${base00}83";
        foreground = "${base07}";
        timeout = 6;
      };
      urgency_critical = {
        background = "#${base00}83";
        foreground = "${base0E}";
        frame_color = "#${base0E}80";
        timeout = 0;
      };
    };
  };
}
