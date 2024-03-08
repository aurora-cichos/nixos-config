{ pkgs, ... }: {
  environment.systemPackages = [
    pkgs.git
    pkgs.kitty
  ];
}