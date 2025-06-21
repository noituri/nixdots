{ config, pkgs, ... }:

{
  users.users.noit = {
    isNormalUser = true;
    description = "noit";
    extraGroups = [ "networkmanager" "wheel" "vboxsf" ];
    packages = with pkgs; [];
    shell = pkgs.nushell;
  };
}
