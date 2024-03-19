{
  pkgs,
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;

    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;

        extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
          darkreader
          ublock-origin
        ];
      };
    };
  };
}
