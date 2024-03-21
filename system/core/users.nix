{pkgs, ...}: {
  users.users.luna = {
    isNormalUser = true;
    description = "luna";
    extraGroups = ["audio" "networkmanager" "video" "wheel" "input" "disk" "libvirtd"];
  };

  users.defaultUserShell = pkgs.zsh;
}
