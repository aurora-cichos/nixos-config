{pkgs, ...}: {
  users.users.luna = {
    isNormalUser = true;
    description = "luna";
    extraGroups = ["audio" "networkmanager" "video" "wheel"];
  };

  users.defaultUserShell = pkgs.zsh;
}
