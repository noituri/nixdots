{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  ];

  programs.waybar.enable = true;
  programs.tofi.enable = true;
  programs.hyprlock.enable = true;

  # TODO: Move whole config here
  services.hypridle = {
    enable = true;
  };
  services.mako = {
    enable = true;
  };

  # TODO: Remove the config files 
  home.file.".config/hypr/hyprland.conf".source = ./config/hyprland.conf;
  home.file.".config/hypr/screenshot_fullscreen.sh".source = ./config/screenshot_fullscreen.sh;
}
