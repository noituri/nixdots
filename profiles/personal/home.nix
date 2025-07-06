{ config, pkgs, inputs, ... }:

{
  imports = [
    ../common/home.nix
    ../../user/wms/hyprland/hyprland.nix
  ];

  home.packages = with pkgs; [
    vlc
    emacs
    zellij
    discord
    inputs.zen-browser.packages.${pkgs.system}.default
    firefox
    google-chrome
    stremio
    obs-studio
    bambu-studio
    kitty
    spotify
  ];

  programs.zed-editor.enable = true;
}
