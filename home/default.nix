{
  inputs,
  config,
  ...
}: {
  config.home.stateVersion = "23.11";
  config.home.extraOutputsToInstall = ["doc" "devdoc"];
  imports = [
    inputs.hyprlock.homeManagerModules.default
    inputs.hypridle.homeManagerModules.default
    ./packages.nix

    ./cli
    ./desktop
    ./misc
  ];
}
