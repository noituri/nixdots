{ config, pkgs, ... }:

{
  programs.steam.enable = true;
  environment.systemPackages = [ pkgs.steam ];
  hardware.graphics.enable32Bit = true;
}
