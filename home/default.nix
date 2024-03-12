{ inputs, config, ... }: {
  imports = [
    ./cli
    ./firefox.nix
  ];
  config.home.stateVersion = "23.11";
}
