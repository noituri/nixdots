{ config, pkgs, ... }:

{
  imports = [
    ../common/home.nix
    ../../user/themes/stylix.nix
  ];

  home.packages = with pkgs; [
    emacs
    zellij
    dconf
  ];
}
