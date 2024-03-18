{pkgs, ...}: {
  gtk = {
    enable = true;

    theme = {
      package = pkgs.tokyonight-gtk-theme;
      name = "Tokyonight-Dark-B";
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };

    font = {
      name = "sansSerif";
      size = 12;
    };
  };

  home = {
    pointerCursor = {
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 12;
    };

    sessionVariables = {
      XCURSOR_SIZE = "12";
      GTK_USE_PORTAL = "1";
    };
  };
}
