{
  inputs,
  outputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default

    ../../system/core
    ../../system/hardware
    ../../system/wayland
  ];

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs;};
    users = {
      "luna" = import ../../home;
    };
  };

  system.stateVersion = "23.11"; #DONT CHANGE
}
