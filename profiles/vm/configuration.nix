{ config, pkgs, ... }:

{
  imports = [
    ../common/configuration.nix
    ../../system/network/vm.nix
    ../../system/users/vm.nix
  ];

  environment.systemPackages = with pkgs; [ ];
  virtualisation.virtualbox.guest.enable = true;
}
