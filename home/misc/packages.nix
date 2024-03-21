{pkgs, ...}: {
  home.packages = with pkgs; [
    libreoffice-fresh
    lutris
    spotify
    steam
    steam-run
    vesktop
  ];
}
