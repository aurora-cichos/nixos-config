{...}: {
  imports = [
    ./bootloader.nix
    ./nix.nix
    ./network.nix
    ./ssh.nix
    ./system.nix
    ./users.nix
  ];
}
