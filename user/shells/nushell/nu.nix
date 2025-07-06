{ config, pkgs, ... }:

{
  programs.nushell = {
    enable = true;
    settings = {
      show_banner = false;
    };
    configFile.source = ./config.nu;
    envFile = {
      text = ''
        $env.EDITOR = 'nvim'
        $env.config.buffer_editor = 'nvim'
        $env.NIXOS_OZONE_WL = 1

        neofetch
      '';
    };
  };
}
