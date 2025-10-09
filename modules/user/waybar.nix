{ ... }: {
  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "top";
        position = "bottom";
        height = 30;

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
