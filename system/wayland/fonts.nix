{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      noto-fonts-emoji
      open-sans
      poly
      (nerdfonts.override {fonts = ["JetBrainsMono" "Mononoki"];})
    ];

    fontconfig = {
      defaultFonts = {
        monospace = ["JetBrainsMono Nerd Font Mono" "Noto Color Emoji"];
        sansSerif = ["Open Sans"];
        serif = ["Poly"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };
}
