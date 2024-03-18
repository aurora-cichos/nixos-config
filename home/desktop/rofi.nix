{
  pkgs,
  config,
  ...
}: let
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "sansSerif 12";

    theme = with config.colorScheme.palette; {
      "*" = {
        bg0 = mkLiteral "#${base00}";
        bg1 = mkLiteral "#${base01}";
        fg = mkLiteral "#${base07}";
        accent = mkLiteral "#${base0D}";
        urgent = mkLiteral "#${base0E}";

        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@fg";
        border-color = mkLiteral "@accent";
        spacing = 2;
      };

      "window" = {
        background-color = mkLiteral "@bg0";
        padding = mkLiteral "5px";
        border = mkLiteral "1px";
        border-radius = mkLiteral "5px";
      };

      "inputbar" = {
        spacing = 0;
        text-color = mkLiteral "@fg";
        padding = mkLiteral "1px";
        children = ["prompt" "textbox-prompt-colon" "entry" "case-indicator"];
      };
      "prompt" = {
        spacing = 0;
        text-color = mkLiteral "@fg";
      };
      "textbox-prompt-colon" = {
        expand = false;
        str = ":";
        margin = mkLiteral "0px 0.3em 0em 0em";
        text-color = mkLiteral "@fg";
      };
      "entry" = {
        spacing = 0;
        text-color = mkLiteral "@fg";
      };
      "case-indicator" = {
        spacing = 0;
        text-color = mkLiteral "@fg";
      };

      "listview" = {
        scrollbar = true;
        padding = mkLiteral "2px 0px 0px";
      };
      "element" = {
        border = 0;
        padding = mkLiteral "1px";
      };
      "element-text" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };
      "element.normal.normal" = {
        background-color = mkLiteral "@bg0";
        text-color = mkLiteral "@fg";
      };
      "element.normal.urgent" = {
        background-color = mkLiteral "@bg0";
        text-color = mkLiteral "@urgent";
      };
      "element.selected.normal" = {
        background-color = mkLiteral "@accent";
        text-color = mkLiteral "@bg0";
      };
      "element.selected.urgent" = {
        background-color = mkLiteral "@accent";
        text-color = mkLiteral "@urgent";
      };
      "element.alternate.normal" = {
        background-color = mkLiteral "@bg1";
        text-color = mkLiteral "@fg";
      };
      "element.alternate.urgent" = {
        background-color = mkLiteral "@bg1";
        text-color = mkLiteral "@urgent";
      };
    };
  };
}
