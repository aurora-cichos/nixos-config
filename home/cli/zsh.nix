{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    autosuggestion.enable = true;
    dotDir = ".config/zsh";

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };
}
