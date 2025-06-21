{ config, pkgs, ... }:

{
  home.file.".config/hypr/hyprland.conf".source = ./config/hyprland.conf;
  home.file.".config/hypr/hypridle.conf".source = ./config/hypridle.conf;
  home.file.".config/hypr/hyprpaper.conf".source = ./config/hyprpaper.conf;
  home.file.".config/hypr/hyprlock.conf".source = ./config/hyprlock.conf;
  home.file.".config/hypr/screenshot_fullscreen.sh".source = ./config/screenshot_fullscreen.sh;
}
