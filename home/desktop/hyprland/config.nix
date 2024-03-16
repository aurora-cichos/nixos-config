{
  config,
  lib,
  ...
}: let
  pointer = config.home.pointerCursor;
in {
  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [
      ];

      xwayland = {
        force_zero_scaling = true;
      };

      input = {
        # keyboard layout
        kb_layout = "pl";
        kb_options = "caps:escape";
        follow_mouse = 1;
        sensitivity = 0.0;
      };

      general = {
        # gaps
        gaps_in = 6;
        gaps_out = 11;

        # border thiccness
        border_size = 2;

        # active border color
        # "col.active_border" = "rgb(${accent})";
        # "col.inactive_border" = "rgb(${surface0})";

        # whether to apply the sensitivity to raw input (e.g. used by games where you aim using your mouse)
        apply_sens_to_raw = 0;
      };

      decoration = {
        # fancy corners
        rounding = 7;

        # blur
        blur = {
          enabled = true;
          size = 3;
          passes = 3;
          ignore_opacity = false;
          new_optimizations = 1;
          xray = true;
          contrast = 0.7;
          brightness = 0.8;
        };

        # shadow config
        drop_shadow = "no";
        shadow_range = 20;
        shadow_render_power = 5;
        "col.shadow" = "rgba(292c3cee)";
      };

      misc = {
        # disable redundant renders
        disable_splash_rendering = true;
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;

        vfr = true;

        # window swallowing
        enable_swallow = true; # hide windows that spawn other windows
        swallow_regex = "^(foot)$";

        # dpms
        mouse_move_enables_dpms = true; # enable dpms on mouse/touchpad action
        key_press_enables_dpms = true; # enable dpms on keyboard action
        disable_autoreload = true; # autoreload is unnecessary on nixos, because the config is readonly anyway
      };

      animations = {
        enabled = true;
        first_launch_animation = false;

        bezier = [
          "smoothOut, 0.36, 0, 0.66, -0.56"
          "smoothIn, 0.25, 1, 0.5, 1"
          "overshot, 0.4,0.8,0.2,1.2"
        ];

        animation = [
          "windows, 1, 4, overshot, slide"
          "windowsOut, 1, 4, smoothOut, slide"
          "border,1,10,default"

          "fade, 1, 10, smoothIn"
          "fadeDim, 1, 10, smoothIn"
          "workspaces,1,4,overshot,slidevert"
        ];
      };

      dwindle = {
        pseudotile = false;
        preserve_split = "yes";
        no_gaps_when_only = false;
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
        ",highrr,auto,1"
        "DP-3,1920x1080,0x0,1"
        "HDMI-A-1,1920x1080@144,0x-1080,1"
      ];
    };
  };
}
