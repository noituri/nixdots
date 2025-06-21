{ config, pkgs, ... }:

{
  imports = [
    # TODO: Make it configurable
    ../user/shells/nu.nix
  ];

  home.packages = with pkgs; [
    yazi
    lazygit
    btop
    zoxide
    starship
    pfetch
    ripgrep
  ];
}
