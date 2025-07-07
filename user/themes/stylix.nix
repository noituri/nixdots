{ config, pkgs, ... }:

{
  # TODO: Build nay theme switcher
  stylix.enable = true;
  stylix.image = ../../wallpapers/wales.jpg;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
}
