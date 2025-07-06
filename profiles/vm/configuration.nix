{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../common/configuration.nix
    ../../system/network/vm.nix
    ../../system/users/vm.nix
  ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  environment.systemPackages = with pkgs; [ ];
  virtualisation.virtualbox.guest.enable = true;
}
