{ config, pkgs, ... }:

{
  imports = [
    ./services/ssh.nix
  ];

  networking.hostName = "noit-vm";
  networking.networkmanager.enable = true;
  services.openssh.enable = true;
}
