{pkgs, ...}: {
  home.packages = with pkgs; [
    catimg
    fd
    glow
    gnumake
    neofetch
    ripgrep
    wget
    unzip
  ];
}
