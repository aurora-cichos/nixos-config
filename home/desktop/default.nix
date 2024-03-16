{...}: {
  imports = [
    ./dunst.nix
    ./hyprland.nix
    ./kitty.nix
    ./packages.nix
    ./rofi.nix
    ./waybar.nix
  ];

  home.stateVersion = "23.11";
}
