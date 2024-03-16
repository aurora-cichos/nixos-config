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

      # decor
      decoration = {
        shadow_offset = "0 5";
        "col.shadow" = "rgba(00000099)";
      };

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
