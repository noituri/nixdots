{ config, pkgs, ... }:

{
  imports = [
    ../common/home.nix
    ../../user/apps/zellij/zellij.nix
  ];

  home.packages = with pkgs; [
    emacs
    dconf
  ];
}
