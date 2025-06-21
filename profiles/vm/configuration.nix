{ config, pkgs, ... }:

{
  imports = [
    ../common/configuration.nix
    ../../system/network/vm.nix
    ../../system/users/vm.nix
    ../../system/wms/hyprland.nix
  ];
}
