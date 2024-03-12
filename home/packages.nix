{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    dconf
    libreoffice-fresh
    pulseaudio
  ];
}
