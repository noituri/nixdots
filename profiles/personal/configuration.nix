{ config, pkgs, ... }:

{
  imports = [
    ../common/configuration.nix
    ../../system/network/personal.nix
    ../../system/users/personal.nix
    ../../system/wms/sddm.nix
    ../../system/wms/hyprland.nix
    ../../system/apps/steam.nix
  ];

  environment.systemPackages = with pkgs; [
    timeshift
  ];
}
