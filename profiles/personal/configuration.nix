{ config, pkgs, ... }:

{
  imports = [
    ../common/configuration.nix
    ../../system/network/personal.nix
    ../../system/users/personal.nix
  ];

  programs.steam.enable = true;
}
