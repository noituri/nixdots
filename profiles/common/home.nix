{ config, pkgs, ... }:

{
  imports = [
    # TODO: Make it configurable
    ../../user/shells/nu.nix
  ];

  home.username = "noit";
  home.homeDirectory = "/home/noit";

  home.packages = with pkgs; [
    yazi
    lazygit
    btop
    zoxide
    starship
    pfetch
    ripgrep

    (writeShellScriptBin "nay" (builtins.readFile ../../bin/nay.sh))
  ];
}
