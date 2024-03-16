{
  config,
  lib,
  ...
}: let
  mod = "SUPER";
  modshift = "${mod}SHIFT";

  # binds $mod + [shift +] {1..10} to [move to] workspace {1..10} (stolen from fufie)
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
  wayland.windowManager.hyprland.settings = {
    bind =
      [
        "${mod},RETURN,exec,firefox"

        "${mod},SPACE,exec,rofi"
        "${mod},MINUS,killactive"
        "${mod},P,pseudo"

        "${mod},H,movefocus,l"
        "${mod},L,movefocus,r"
        "${mod},K,movefocus,u"
        "${mod},J,movefocus,d"

        "${mod},V,togglefloating," # toggle floating for the focused window
        "${mod},F,fullscreen," # fullscreen focused window
      ]
      ++ workspaces;

    bindm = [
      "${mod},mouse:272,movewindow"
      "${mod},mouse:273,resizewindow"
    ];

    binde = [
      # volume controls
      ",XF86AudioRaiseVolume, exec, nc -U /tmp/barbie-vol.sock; pamixer -i 5"
      ",XF86AudioLowerVolume, exec, nc -U /tmp/barbie-vol.sock; pamixer -d 5"
    ];
    # binds that are locked, a.k.a will activate even while an input inhibitor is active
    bindl = [
      # media controls
      ",XF86AudioPlay,exec,playerctl play-pause"
      ",XF86AudioPrev,exec,playerctl previous"
      ",XF86AudioNext,exec,playerctl next"
    ];
  };
}
