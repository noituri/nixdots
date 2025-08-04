{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    config = {
      user.name = "noituri";
      user.email = "mikolaj.radkowski@protonmail.com";
    };
  };
}
