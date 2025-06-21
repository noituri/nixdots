{ config, pkgs, ... }:

{
  networking.hostName = "noit-pc";
  networking.networkmanager.enable = true;
}
