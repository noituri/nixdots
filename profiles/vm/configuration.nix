{ config, pkgs, ... }:

{
  imports = [
    ../common/configuration.nix
    ../../system/network/vm.nix
    ../../system/users/vm.nix
    ../../system/wms/sddm.nix
    ../../system/wms/hyprland.nix
  ];

  environment.systemPackages = with pkgs; [
    virtiofsd
  ];
  virtualisation.virtualbox.guest.enable = true;
}
