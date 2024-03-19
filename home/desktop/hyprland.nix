{
  pkgs,
  config,
  ...
}: let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.waybar}/bin/waybar &
    ${pkgs.swww}/bin/swww init &

    sleep 1

    ${pkgs.swww}/bin/swww img ${/home/luna/nixos-config/theme/wallpaper.png} &
  '';

  mod = "SUPER";

  # binds ${mod} + [shift +] {1..10} to [move to] workspace {1..10} (stolen from fufie)
  workspaces = builtins.concatLists (builtins.genList (
      x: let
        ws = let
          c = (x + 1) / 10;
        in
          builtins.toString (x + 1 - (c * 10));
      in [
        "${mod}, ${ws}, workspace, ${toString (x + 1)}"
        "${mod} SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
      ]
    )
    10);
in {
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      # startup
      exec-once = ''${startupScript}/bin/start'';

      # variables
      general = with config.colorScheme.palette; {
        border_size = 2;
        gaps_in = 5;
        gaps_out = "5, 10, 10, 10";

        "col.active_border" = "rgba(${base0D}ff)";
        "col.inactive_border" = "rgba(${base01}ff)";
      };

      decoration = {
        rounding = 5;
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
        "HDMI-A-1, 1920x1080, 1920x0, 1"
      ];

      # binds
      bind =
        [
          "${mod}, RETURN, exec, kitty"

          "${mod}, SPACE, exec, rofi -show drun"
          "${mod}, MINUS, killactive"
          "${mod}, p, pseudo"

          "${mod}, h, movefocus, l"
          "${mod}, l, movefocus, r"
          "${mod}, k, movefocus, u"
          "${mod}, j, movefocus, d"

          "${mod}, v, togglefloating"
          "${mod}, f, fullscreen"
        ]
        ++ workspaces;

      bindm = [
        "${mod}, mouse:272, movewindow"
        "${mod}, mouse:273, resizewindow"
      ];
    };
  };
}
