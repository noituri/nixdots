{ config, pkgs, ... }:

let
  nayConfig = import ./nayConfig.nix;
in
{
  imports = [
    ./profiles/personal/home.nix
  ];
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.sessionVariables = {
    DOT_FILES_PATH = nayConfig.dotfilesPath;
  };

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;
}
