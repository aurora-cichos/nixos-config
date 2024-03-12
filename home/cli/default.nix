{...}: {
  imports = [
    ./git.nix
    ./neovim.nix
    ./packages.nix
    ./run-as-service.nix
    ./xdg.nix
    ./zsh.nix
  ];
}
