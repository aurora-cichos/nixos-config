{pkgs, config, ...}:
let
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "sansSerif 13";

    theme = with config.colorScheme.palette; {
      "*" = {
        background-color = mkLiteral "#${base00}";
        foreground-color = mkLiteral "#${base0D}";
      };

      "#inputbar" = {
        children = map mkLiteral [ "prompt" "entry" ];
      };

      "#textbox-prompt-colon" = {
        expand = false;
        str = ":";
        margin = mkLiteral "0px 0.3em 0em 0em";
        text-color = mkLiteral "@foreground-color";
      };
    };
  };
}
