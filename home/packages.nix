{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    calcurse
    dconf
    gimp
    libreoffice-fresh
    pulseaudio
    spotify
    steam
    vesktop
  ];
}
