{ config, pkgs, ... }:

{
  imports = [
    ../common/home.nix
    ../../user/wms/hyprland/hyprland.nix
    ../../user/themes/stylix.nix
  ];

  home.packages = with pkgs; [
    vlc
    emacs
    zellij
    firefox
    google-chrome
    kitty
  ];
}
