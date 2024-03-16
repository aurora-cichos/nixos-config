{pkgs, ...}:
let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.waybar}/bin/waybar &
    ${pkgs.swww}/bin/swww init &

    sleep 1

    ${pkgs.swww}/bin/swww img ${/home/luna/nixos-config/theme/wallpaper.png} &
  '';
in {
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      # startup
      exec-once = ''${startupScript}/bin/start'';

      # variables
      general = {
        border_size = 2;
        gaps_in = 5;
        gaps_out = 10;
      };
      
      input = {
        sensitivity = -0.1;
      };

      workspace = [
        "1, monitor:DP-3"
        "2, monitor:DP-3"
        "3, monitor:DP-3"
        "4, monitor:DP-3"
        "5, monitor:DP-3"
        "6, monitor:HDMI-A-1"
        "7, monitor:HDMI-A-1"
        "8, monitor:HDMI-A-1"
        "9, monitor:HDMI-A-1"
      ];
      monitor = [
        " , preferred, auto, 1"
        "DP-3, 1920x1080@240, 0x0, 1"
        "HDMI-A-1, 1920x1080, 1080x0, 1"
      ];

      # binds
      "$mod" = "SUPER";

      bind = [
        "$mod, RETURN, exec, kitty"
        "$mod, f, exec, firefox"
        "$mod, SPACE, exec, rofi -show drun"
        "$mod, MINUS, killactive"

        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };
}
