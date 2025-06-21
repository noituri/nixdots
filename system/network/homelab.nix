{ config, pkgs, ... }:

{
  imports = [
    ./services/ssh.nix
  ];

  networking.hostName = "noit-lab";
  networking.networkmanager.enable = true;
  # TODO: vpn setup
}
