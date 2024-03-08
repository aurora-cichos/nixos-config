# Nixvim config
{ pkgs, nixvim, ... }: {
  imports = [
    flake.homeManager.Modules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;
    plugins.lualine.enable = true;
  };
}