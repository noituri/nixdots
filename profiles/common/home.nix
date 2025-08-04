{ config, pkgs, ... }:

{
  imports = [
    ../../user/shells/starship/starship.nix
    ../../user/shells/nushell/nu.nix
    ../../user/themes/stylix.nix
    ../../user/apps/neovim/neovim.nix
  ];

  home.username = "noit";
  home.homeDirectory = "/home/noit";

  home.packages = with pkgs; [
    yazi
    lazygit
    btop
    zoxide
    starship
    neofetch
    ripgrep
    bat

    (writeShellScriptBin "nay" (builtins.readFile ../../bin/nay.sh))
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
  };

  programs.helix.enable = true;
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;
}
