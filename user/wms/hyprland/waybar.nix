{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    style = ''
* {
    font-size:15px;
    font-family: "Hack Nerd Font";
    padding:0;
    margin:0;
    min-height:0;
}
window#waybar{
    all:unset;
}
.modules-left {
    padding:7px;
    margin: 10 0 5 10;
    border-radius:10px;
    background: rgba(100, 100, 100, .6);
    box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
}
.modules-center {
    padding:7px;
    margin: 10 0 5 0;
    border-radius:10px;
    background: rgba(100, 100, 100, .6);
    box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
}
.modules-right {
    padding:7px;
    margin: 10 10 5 0;
    border-radius:10px;
    background: rgba(100, 100, 100, .6);
    box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
}
tooltip {
    background: rgba(100, 100, 100, .6);
    color: rgba(250, 250, 250, 1.0);
}
#clock:hover, #custom-pacman:hover, #custom-notification:hover,#bluetooth:hover,#network:hover,#battery:hover, #cpu:hover,#memory:hover,#temperature:hover{
    transition: all .3s ease;
    color: rgba(250, 250, 250, 1.0);
}
#custom-notification {
    padding: 0px 5px;
    transition: all .3s ease;
    color: rgba(250, 250, 250, 1.0);
}
#clock{
    padding: 0px 5px;
    color: rgba(250, 250, 250, 1.0);
    transition: all .3s ease;
}
#custom-pacman{
    padding: 0px 5px;
    transition: all .3s ease;
    color: rgba(250, 250, 250, 1.0);

}
#workspaces {
    padding: 0px 5px;
}
#workspaces button {
    all:unset;
    padding: 0px 5px;
    color:rgba(210, 210, 210, 1.0);
    transition: all .2s ease;
}
#workspaces button:hover {
    color:rgba(190, 190, 190, 1.0);
    border: none;
    text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
    transition: all 0.3s ease;
}
#workspaces button.active {
    color: rgba(250, 250, 250, 1.0);
    border: none;
    text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
}
#workspaces button.empty {
    color:rgba(150, 150, 150, 1.0);
    border: none;
    text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .2);
}
#workspaces button.empty:hover {
    color: rgba(250, 250, 250, 1.0);
    border: none;
    text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
    transition: all 0.3s ease;
}
#workspaces button.empty.active {
    color: rgba(250, 250, 250, 1.0);
    border: none;
    text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
}
#bluetooth{
    padding: 0px 5px;
    transition: all .3s ease;
    color: rgba(250, 250, 250, 1.0);

}
#network{
    padding: 0px 5px;
    transition: all .3s ease;
    color: rgba(250, 250, 250, 1.0);

}
#battery{
    padding: 0px 5px;
    transition: all .3s ease;
    color: rgba(250, 250, 250, 1.0);


}
#battery.charging {
    color: #26A65B;
}

#battery.warning:not(.charging) {
    color: #ffbe61;
}

#battery.critical:not(.charging) {
    color: #f53c3c;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}
#group-expand{
    padding: 0px 5px;
    transition: all .3s ease; 
}
#custom-expand{
    padding: 0px 5px;
    color: rgba(250, 250, 250, .6);
    text-shadow: 0px 0px 2px rgba(0, 0, 0, .7);
    transition: all .3s ease; 
}
#custom-expand:hover{
    color:rgba(255,255,255,.2);
    text-shadow: 0px 0px 2px rgba(255, 255, 255, .5);
}
#custom-colorpicker{
    padding: 0px 5px;
}
#cpu,#memory,#temperature{
    padding: 0px 5px;
    transition: all .3s ease; 
    color: rgba(250, 250, 250, 1.0);

}
#custom-endpoint{
    color:transparent;
    text-shadow: 0px 0px 1.5px rgba(0, 0, 0, 1);

}
#tray{
    padding: 0px 5px;
    transition: all .3s ease; 

}
#tray menu * {
    padding: 0px 5px;
    transition: all .3s ease; 
}

#tray menu separator {
    padding: 0px 5px;
    transition: all .3s ease; 
}
    '';
    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        reload_style_on_change = true;
        modules-left = [ "custom/notification" "clock" "pulseaudio"];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [ "group/expand" "bluetooth" "network" "battery"];


        "hyprland/workspaces" = {
          format = "{id}";
          format-icons = {
            active = "";
            default = "";
            empty = "";
          };
          persistent-workspaces = {
            "*" = [ 1 2 3 4 5 ];
          };
          all-outputs = true;
        };
        "custom/notification" = {
          tooltip = false;
          format = "";
          on-click = "swaync-client -t -sw";
          escape = true;
        };
        clock = {
          format = "{:%I:%M:%S %p} ";
          interval = 1;
          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
            format = {
              today = "<span color='#fAfBfC'><b>{}</b></span>";
            };
          };
          actions = {
            on-click-right = "shift_down";
            on-click = "shift_up";
          };
        };
        network = {
          format-wifi = "";
          format-ethernet = "";
          format-disconnected = "";
          tooltip-format-disconnected = "Error";
          tooltip-format-wifi = "{essid} ({signalStrength}%) ";
          tooltip-format-ethernet = "{ifname} 🖧 ";
          on-click = "kitty nmtui";
        };
        bluetooth = {
          format-on = "󰂯";
          format-off = "BT-off";
          format-disabled = "󰂲";
          format-connected-battery = "{device_battery_percentage}% 󰂯";
          format-alt = "{device_alias} 󰂯";
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\n{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\n{device_address}\n{device_battery_percentage}%";
          on-click-right = "blueman-manager";
        };
        battery = {
          interval = 30;
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% 󰂄";
          format-plugged = "{capacity}% 󰂄 ";
          format-alt = "{time} {icon}";
          format-icons = [
            "󰁻"
            "󰁼"
            "󰁾"
            "󰂀"
            "󰂂"
            "󰁹"
          ];
        };
        "custom/expand" = {
          format = "";
          tooltip = false;
        };
        "custom/endpoint" = {
          format = "|";
          tooltip = false;
        };
        "group/expand" = {
          orientation = "horizontal";
          drawer = {
            transition-duration = 600;
            transition-to-left = true;
            click-to-reveal = true;
          };
          modules = [ "custom/expand" "custom/colorpicker" "cpu" "memory" "temperature" "custom/endpoint" ];
        };
        "custom/colorpicker" = {
          format = "{}";
          return-type = "json";
          interval = "once";
          exec = "~/.config/waybar/scripts/colorpicker.sh -j";
          on-click = "~/.config/waybar/scripts/colorpicker.sh";
          signal = 1;
        };
        cpu = {
          format = "󰻠";
          tooltip = true;
        };
        memory = {
          format = "";
        };
        temperature = {
          critical-threshold = 80;
          format = "";
        };
        tray = {
          icon-size = 14;
          spacing = 10;
        };
      };
    };
  };
}
