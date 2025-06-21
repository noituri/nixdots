{ config, pkgs, ... }:

{
  users.users.noit = {
    isNormalUser = true;
    description = "noit";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.nushell;
  };
}
