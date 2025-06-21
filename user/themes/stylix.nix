{ config, pkgs, ... }:

{
  # TODO: Build nay theme switcher
  stylix.enable = true;
  # TODO: Change it
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
}
