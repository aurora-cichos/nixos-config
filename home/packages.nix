{pkgs, ...}: {
  home.packages = with pkgs; [
    pulseaudio 

    kdePackages.dolphin
  ];
}
