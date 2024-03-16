{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./binds.nix
    ./config.nix
  ];

  home.packages = with pkgs;
  with inputs.hyprcontrib.packages.${pkgs.system}; [
    grim
    hyprpicker
    libnotify
    slurp
    wf-recorder
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
    systemd = {
      variables = ["--all"];
      extraCommands = [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };
  };
}
