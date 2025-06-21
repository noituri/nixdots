{ config, pkgs, ... }:

{
  programs.steam.enable = true;
  environment.systemPackages = [ pkgs.steam ];
  hardware.opengl.driSupport32Bit = true;
}
