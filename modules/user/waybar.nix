{ config, lib, pkgs, ... }: {
  programs.waybar = {
    enable = true;
    
    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        height = 30;
        modules-left = ["sway/workspaces", "sway/mode"];
        modules-center = [];
        modules-right = ["pulseaudio", "network", "custom/cpu_gpu_temp", "memory", "temperature", "battery", "clock"];
        
        "pulseaudio" = {
          format = "VOL: {volume}%";
          format-muted = "MUTED";
          interval = 1;
        };
        
        "battery" = {
          format = "| BAT: {capacity}%";
          interval = 30;
        };
        
        "network" = {
          format-wifi = "| W: (ESSID: {essid}, Bit Rate: {signalStrength}%, Signal: {signalStrength}%)";
          format-disconnected = "Disconnected";
          interval = 5;
        };
        
        "temperature" = {
          "critical-threshold" = 80;
          format = "| TEMP: {temperatureC}°C {icon}";
        };
        
        "memory" = {
          format = "| MEM: {used}/{total}";
          interval = 10;
        };
        
        "clock" = {
          format = "| {:%Y-%m-%d %H:%M:%S}";
          interval = 1;
        };
        
        "custom/cpu_gpu_temp" = {
          exec = "${pkgs.bash}/bin/bash -c 'echo \"| CPU/GPU TEMP: $(${pkgs.lm_sensors}/bin/sensors | grep -A 0 \"CPU\" | cut -c16-19)°C\"'";
          interval = 10;
          format = "{}";
        };
      };
    };
    
    style = ''
      * {
          color: #FFFFFF;
          border: none;
          border-radius: 0;
          font-family: monospace;
      }
      window#waybar {
          background: rgba(0, 0, 0, 0.8);
      }
      #workspaces button {
          color: #FFFFFF;
      }
      #workspaces button.focused {
          color: #FFFFFF;
      }
      #pulseaudio, 
      #network, 
      #custom-cpu_gpu_temp, 
      #memory, 
      #temperature, 
      #battery, 
      #clock {
          color: #FFFFFF;
          padding: 0 5px;
      }
      #temperature.critical {
          color: #FFFFFF;
      }
      #battery.warning {
          color: #FFFFFF;
      }
      #battery.critical {
          color: #FFFFFF;
      }
    '';
  };
  
  environment.systemPackages = with pkgs; [
    lm_sensors
  ];
}
