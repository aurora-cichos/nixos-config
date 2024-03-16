{...}: {
  imports = [
    ./bootloader.nix
    ./locale.nix
    ./nix.nix
    ./network.nix
    ./packages.nix
    ./ssh.nix
    ./users.nix
  ];
}
