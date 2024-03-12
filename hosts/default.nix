{
  nixpkgs,
  self,
  ...
}: let
  inherit (self) inputs;
  core = ../system/core;
  bootloader = ../system/core/bootloader.nix;
  nvidia = ../system/nvidia;
  wayland = ../system/wayland;
  hw = inputs.nixos-hardware-nixosModules;
  hmModule = inputs.home-manager.nixosModules.home-manager;

  shared = [core];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
      inherit self;
    };
    users.luna = {
      imports = [../home];

      _module.args.theme = import ../theme;
    };
  };
in {
  # desktop
  sol = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules =
      [
        {networking.hostName = "sol";}
        ./sol
        bootloader
        hmModule
        nvidia
        wayland
        {inherit home-manager;}
      ]
      ++ shared;
    specialArgs = {inherit inputs;};
  };
}
