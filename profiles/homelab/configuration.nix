{ config, pkgs, ... }:

{
  imports = [
    ../common/configuration.nix
    ../../system/network/homelab.nix
    ../../system/users/homelab.nix
  ];
}
