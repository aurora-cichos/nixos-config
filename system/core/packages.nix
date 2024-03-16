{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vim
  ];
  programs.zsh.enable = true;
}
