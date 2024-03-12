{ inputs, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    autocd = true;
    dotDir = ".config/zsh";

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };

  # users.defaultUserShell = pkgs.zsh;
}
