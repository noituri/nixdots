{ config, pkgs, ... }:

{
  networking.hostName = "noit-vm";
  networking.networkmanager.enable = true;
  services.openssh.enable = true;
}
