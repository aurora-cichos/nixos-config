#
# users.nix
#
# Configure the users
#

{ config, ... }:

{
  users.users = {
    luna = {
      initialPassword = "password";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      extraGroups = [ "audio" "networkmanager" "video" "wheel" ];
    };
  };
}
