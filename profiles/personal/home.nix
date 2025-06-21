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
    discord
    # TODO: Zen browser
    firefox
    google-chrome
    stremio
    obs-studio
    bambu-studio
    kitty
    spotify
  ];
}
