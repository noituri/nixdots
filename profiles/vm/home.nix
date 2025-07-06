{ config, pkgs, ... }:

{
  imports = [
    ../common/home.nix
  ];

  home.packages = with pkgs; [
    emacs
    zellij
    dconf
  ];
}
