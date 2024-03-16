{...}: {
  imports = [
    ./bootloader.nix
    ./gpg.nix
    ./locale.nix
    ./nix.nix
    ./network.nix
    ./ssh.nix
    ./users.nix
  ];
}
