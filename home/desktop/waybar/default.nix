{
  pkgs,
  lib,
  ...
}: {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };
    settings = {
      mainBar = {
        layer = "top";
        position = "left";
        width = 57;
        spacing = 7;
        modules-left = [
          "hyprland/workspaces"
          "custom/lock"
        ];
        modules-center = [];
        modules-right = ["audio" "network" "clock" "custom/power"];
        "hyprland/workspaces" = {
          on-click = "activate";
          format = "{icon}";
          active-only = false;
          format-icons = {
            "1" = "一";
            "2" = "二";
            "3" = "三";
            "4" = "四";
            "5" = "五";
            "6" = "六";
            "7" = "七";
            "8" = "八";
            "9" = "九";
            "10" = "十";
          };

          persistent_workspaces = {
            "*" = 5;
          };
        };

        "custom/lock" = {
          tooltip = false;
          on-click = "sh -c '(sleep 0.5s; hyprlock)' & disown";
          format = "";
        };
        "custom/power" = {
          tooltip = false;
          on-click = "wlogout &";
          format = "";
        };
        clock = {
          format = ''
            {:%H
            %M}'';
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
        };
        network = {
          format-wifi = "󰤨";
          format-ethernet = "󰤨";
          format-alt = "󰤨";
          format-disconnected = "󰤭";
          tooltip-format = "{ipaddr}/{ifname} via {gwaddr} ({signalStrength}%)";
        };
        audio = {
          scroll-step = 5;
          tooltip = true;
          tooltip-format = "{volume}% {format_source}";
          on-click = "${pkgs.killall}/bin/killall pavucontrol || ${pkgs.pavucontrol}/bin/pavucontrol";
          format = " {icon}\n{volume}%";
          format-bluetooth = "󰂯 {icon} {volume}%";
          format-muted = "󰝟 ";
          format-icons = {
            default = ["" "" " "];
          };
        };
      };
    };
  };
}
