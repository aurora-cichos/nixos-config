{pkgs, config, ... }: 
let
  css = with config.colorScheme.palette; ''
    * {
      border: none;
      border-radius: 0;
      font-family: JetBrainsMono Nerd Font;
      font-size: 12px;
      min-height: 0;
    }

    window#waybar {
      background: transparent;
      color: #${base05};
    }

    #workspaces {
      background-color: #${base00};
      margin: 5px;
      margin-left: 10px;
      border-radius: 5px;
    }
    #workspaces button {
      padding: 5px 10px;
      color: #${base08};
    }
    #workspaces button.active {
      background-color: #${base03};
      border-radius: 5px;
    }
    #workspaces button.hover {
      background-color: #${base01};
    }

    #clock, #pulseaudio, #network {
      background-color: #${base00};
      padding: 5px 10px;
      margin: 5px 0px;
    }

    #clock {
      color: #${base0E};
      border-radius: 0px 5px 5px 0px;
      margin-right: 10px;
    }

    #network {
      color: #${base0E};
      border-radius: 5px 0px 0px 5px;
    }

    #pulseaudio {
      color: #${base0E};
    }
  '';
in {
  programs.waybar = {
    enable = true;
    style = css;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 10;
        spacing = 0;

        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [];
        modules-right = ["network" "pulseaudio" "clock"];

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
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
            "6" = [];
            "7" = [];
            "8" = [];
            "9" = [];
            "10" = [];
          };
        };

        pulseaudio = {
          scroll-step = 5;
          tooltip = true;
          tooltip-format = "{volume}% {format_source}";
          on-click = "${pkgs.killall}/bin/killall pavucontrol || ${pkgs.pavucontrol}/bin/pavucontrol";
          format = " {icon} {volume}%";
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
