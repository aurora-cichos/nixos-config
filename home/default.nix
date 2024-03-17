{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default

    ./cli
    ./desktop
    ./misc
  ];

  home.username = "luna";
  home.homeDirectory = "/home/luna";

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-dark;

  programs.home-manager.enable = true;
  home.stateVersion = "23.11"; # DON'T CHANGE
}
