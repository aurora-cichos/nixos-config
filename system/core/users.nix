{...}: {
  users.users.luna = {
    isNormalUser = true;
    description = "luna";
    extraGroups = ["audio" "networkmanager" "video" "wheel"];
  };
}
