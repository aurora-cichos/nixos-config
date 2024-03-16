{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      noto-fonts-emoji
      (nerdfonts.override {fonts = ["JetBrainsMono"];})
    ];

    fontconfig = {
      defaultFonts = {
        monospace = ["JetBrainsMono Nerd Font Mono" "Noto Color Emoji"];
        # sansSerif = []
        # serif = []
        emoji = ["Noto Color Emoji"];
      };
    };
  };
}
