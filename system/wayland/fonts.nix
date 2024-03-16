{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      noto-fonts-emoji
      (nerdfonts.override {fonts = ["JetBrainsMono" "Mononoki"];})
    ];

    fontconfig = {
      defaultFonts = {
        monospace = ["Mononoki Nerd Font Mono" "Noto Color Emoji"];
        # sansSerif = []
        # serif = []
        emoji = ["Noto Color Emoji"];
      };
    };
  };
}
