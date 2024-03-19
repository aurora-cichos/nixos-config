{pkgs, ...}: {
  home.packages = with pkgs; [
    libreoffice-fresh
    spotify
    steam
    vesktop
  ];
}
