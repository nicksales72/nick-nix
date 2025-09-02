{ ... }: {
  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "top";
        position = "bottom";
        height = 30;

        "modules-left"   = [ "hyprland/workspaces" "hyprland/submap" ];
        "modules-center" = [ ];
        "modules-right"  = [ "pulseaudio" "network" "memory" "temperature" "battery" "clock" ];

        battery = {
          format = "| BAT: {capacity}%";
          interval = 30;
        };
        clock = {
          format = "| {:%Y-%m-%d %H:%M}";
          interval = 1;
        };
        memory = {
          format = "| MEM: {used}/{total}";
          interval = 10;
        };
        network = {
          "format-disconnected" = "Disconnected";
          "format-wifi" = "| W: {essid}";
          interval = 5;
        };
        pulseaudio = {
          format = "VOL: {volume}%";
          "format-muted" = "MUTED";
          interval = 1;
        };
        temperature = {
          "critical-threshold" = 80;
          format = "| TEMP: {temperatureC}°C {icon}";
        };
        "hyprland/workspaces" = {
          format = "{icon} {name}";
          "on-click" = "hyprctl dispatch workspace {id}";
          "format-icons" = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            urgent = "";
            active = "";
            default = "";
          };
        };
      }
    ];

    style = ''
      * {
          color: #FFFFFF;
          border: none;
          border-radius: 0;
          font-family: monospace;
      }

      window#waybar {
          background: rgba(0, 0, 0, 0.5);
      }

      #workspaces button {
          color: #FFFFFF;
      }

      #workspaces button.focused {
          color: #FFFFFF;
      }

      #pulseaudio,
      #network,
      #memory,
      #temperature,
      #battery,
      #clock {
          color: #FFFFFF;
          padding: 0 5px;
      }

      #temperature.critical { color: #FFFFFF; }
      #battery.warning      { color: #FFFFFF; }
      #battery.critical     { color: #FFFFFF; }
    '';
  };
}
