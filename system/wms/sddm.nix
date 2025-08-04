{ config, pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "sugar-dark";
  };
  environment.systemPackages = [ pkgs.sddm-sugar-dark ];
}
