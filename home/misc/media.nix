{pkgs, ...}: {
  home.packages = with pkgs; [playerctl pavucontrol pulsemixer imv];
  programs.mpv = {
    enable = true;
    bindings = {
      UP = "add volume +2";
      DOWN = "add volume -2";
    };
    config = {
      hwdec = "auto-safe";
      gpu-context = "wayland";
      vo = "gpu";
      profile = "gpu-hq";

      osc = false;
      border = false;
    };
  };
}
