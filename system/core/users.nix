{
  config,
  pkgs,
  ...
}: {
  programs.zsh.enable = true;
  users = {
    mutableUsers = true;
    users = {
      luna = {
        isNormalUser = true;
        extraGroups = [
          "audio"
          "input"
          "networkmanager"
          "nix"
          "power"
          "video"
          "wheel"
        ];
        shell =
          if config.services.greetd.enable
          then pkgs.zsh
          else pkgs.bash;
      };
    };
  };
}
