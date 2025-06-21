{ config, pkgs, ... }:

{
  imports = [
    ../common/configuration.nix
    ../../system/network/personal.nix
    ../../system/users/personal.nix
    ../../system/wms/hyprland.nix
  ];

  programs.steam.enable = true;
}
