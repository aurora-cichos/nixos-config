# Nixvim config
{ pkgs, ... }: {
  imports = [
    nixvim.homeManager.Modules.nixvim
  ];
  
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;
    plugins.lualine.enable = true;
  };
}