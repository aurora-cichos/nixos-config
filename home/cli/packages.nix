{pkgs, ...}: {
  home.packages = with pkgs; [
    ripgrep
    imagemagick
    wget
    unzip
  ];
}
