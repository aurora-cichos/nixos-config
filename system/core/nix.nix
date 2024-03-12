{
  config,
  pkgs,
  cfg,
  lib,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    alejandra
    git
  ];

  nixpkgs.config.allowUnfree = true;

  # faster rebuilding
  documentation = {
    enable = true;
    doc.enable = false;
    man.enable = true;
    dev.enable = false;
  };

  nix = {
    package = pkgs.nixUnstable;

    registry = lib.mapAttrs (_: v: {flake = v;}) inputs;
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      extra-experimental-features = ["flakes" "nix-command"];

      # binary cache
      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
        "https://nixpkgs-unfree.cachix.org"
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nixpkgs-unfree.cachix.org-1:hqvoInulhbV4nJ9yJOEr+4wxhDV4xq2d1DK7S6Nj6rs="
      ];
    };
  };

  system.stateVersion = "23.11"; #DONT TOUCH
}
