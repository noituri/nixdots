{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../common/configuration.nix
    ../../system/network/personal.nix
    ../../system/users/personal.nix
    ../../system/wms/sddm.nix
    ../../system/wms/hyprland.nix
    ../../system/apps/steam.nix
    ../../system/fonts/nerd-fonts.nix
  ];

  environment.systemPackages = with pkgs; [
    timeshift
    wl-clipboard
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
