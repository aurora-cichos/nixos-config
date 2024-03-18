{
  pkgs,
  config,
  ...
}: {
  qt = {
    enable = true;
    platformTheme = "qtct";
    style = {
      package = pkgs.libsForQt5.breeze-qt5;
      name = "breeze";
    };
  };

  home.packages = with pkgs; [
    # libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
  ];
}
