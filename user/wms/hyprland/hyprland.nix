{ config, pkgs, ... }:

{
  imports = [ ./waybar.nix ];

  home.packages = with pkgs; [
  ];

  programs.tofi.enable = true;
  programs.hyprlock.enable = true;

  # TODO: Move whole config here
  services.hyprpaper = {
    enable = true;
  };
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "hyprlock";
      };

      listener = [
        # {
        #   timeout = 0;
        #   on-timeout = "hyprlock";
        # }
        # {
        #   timeout = 2;
        #   on-timeout = "systemctl suspend";
        #   on-resume = "pkill hyprlidle";
        # }
      ];
    };
  };
  services.mako = {
    enable = true;
  };

  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.hyprcursor;
    hyprcursor.enable = true;
  };

  home.file.".config/hypr/hyprland.conf".source = ./config/hyprland.conf;
  # home.file.".config/hypr/hyprlock.conf".source = ./config/hyprlock.conf;
  home.file.".config/hypr/screenshot_fullscreen.sh".source = ./config/screenshot_fullscreen.sh;
}
