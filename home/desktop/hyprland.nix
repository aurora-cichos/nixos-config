{pkgs, ...}:
let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.waybar}/bin/waybar &
    ${pkgs.swww}/bin/swww init &

    sleep 1

    ${pkgs.swww}/bin/swww img ${../../theme/wallpaper.png} &
  '';
in {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # startup
      exec-once = ''${startupScript}/bin/start'';

      # binds
      "$mod" = "SUPER";

      bind = [
        "$mod, RETURN, exec, kitty"
        "$mod, f, exec, firefox"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };
}
