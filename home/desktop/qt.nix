{pkgs, ...}: {
  qt = {
    enable = true;
    platformTheme = "gtk"; # "qtct"
  };

  home.packages = with pkgs; [
    libsForQt5.qttools
    libsForQt5.qt5ct
  ];
}
