{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Complete Nerd Font Mono";
      size = 13;
    };
    theme = "Tokyo Night";
  };
}
