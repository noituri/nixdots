{ config, pkgs, ... }:

{
  networking.hostName = "noit-lab";
  networking.networkmanager.enable = true;
  # TODO: ssh & vpn setup
}
