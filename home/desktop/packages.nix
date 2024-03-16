{pkgs, ...}: {
  home.packages = with pkgs; [
    swww

    kdePackages.dolphin
  ];
}
