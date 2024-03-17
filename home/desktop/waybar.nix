{pkgs, config, ... }: 
let
  css = with config.colorScheme.palette; ''
    * {
      border: none;
      border-radius: 0;
      font-family: JetBrainsMono Nerd Font;
      font-size: 14px;
      min-height: 0;
    }

    window#waybar {
      background: transparent;
      color: #${base05};
    }

    #workspaces {
      background-color: #${base00};
      margin: 5px;
      margin-left: 10px
      border-radius: 5px;
    }
    #workspaces button {
      padding: 5px 10px;
      color: #${base08};
    }
    #workspaces button.focused {
      color: #${base02};
      background-color: #${base05};
      border-radius: 5px;
    };
    #workspaces button.hover {
      background-color: #${base0C};
      color: #${base08};
    }

    #clock, #pulseaudio, #network {
      background-color: #${base08};
      padding: 5px 10px;
      margin 5px 0px;
    }

    #clock {
      color: #${base0E};
      border-radius: 0px 5px 5px 0px;
      margin-right: 10px;
    }

    #network {
      color: #${base0F};
      border-radius: 5px 0px 0px 5px;
    }

    #pulseaudio {
      color: #${base09};
    }
  '';
in {
  programs.waybar = {
    enable = true;
    style = css;

    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        height = 30;
        spacing = 7;

        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [];
        modules-right = ["pulseaudio" "network" "clock"];

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
            "*" = 10;
          };
        };

        pulseaudio = {
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
        network = {
          format-wifi = "󰤨";
          format-ethernet = "󰤨";
          format-alt = "󰤨"; format-disconnected = "󰤭"; tooltip-format = "{ipaddr}/{ifname} via {gwaddr} ({signalStrength}%)";
        };
        clock = {
          format = "󰅐 {:%H:%M}";
        };
      };
    };
  };
}
