#
# system.nix
#
# Configure the system
#

{ pkgs, config, ... }:

{
  # Networking
  networking.hostName = "sol";
  networking.networkmanager.enable = true;

  # Bootloader
  # Switched bootloader from systemd-boot to grub to get to work in VM
  # (feel free to switch back to systemd on actual hardware if work future me)
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}