{ config, pkgs, inputs, ... }:

{
  imports = [
    ../common/home.nix
    ../../user/apps/zellij/zellij.nix
  ];

  home.packages = with pkgs; [
    vlc
    emacs
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
