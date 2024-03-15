{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    calcurse
    dconf
    gimp
    keepassxc
    libreoffice-fresh
    pulseaudio
    spotify
    steam
    vesktop
  ];
}
