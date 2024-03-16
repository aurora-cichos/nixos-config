{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./cli
    ./desktop

    ./packages.nix
  ];

  home.username = "luna";
  home.homeDirectory = "/home/luna";

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.11"; # DON'T CHANGE
}
