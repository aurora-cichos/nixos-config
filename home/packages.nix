{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    calcurse
    dconf
    libreoffice-fresh
    pulseaudio
    spotify
    steam
    vencord
  ];
}
