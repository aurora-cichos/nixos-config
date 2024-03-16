{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      jetbrains-mono
      lexend
      noto-fonts-cjk
      noto-fonts-emoji
      (nerdfonts.override {fonts = ["JetBrainsMono"];})
    ];

    # fix emojis
    fontconfig = {
      defaultFonts = {
        monospace = [
          "JetBrainsMono"
          "JetBrainsMono Nerd Font Complete Mono"
          "JetBrainsMono Nerd Font"
          "Noto Color Emoji"
        ];
        sansSerif = ["Lexend" "Noto Color Emoji"];
        serif = ["Noto Serif" "Noto Color Emoji"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };
}
