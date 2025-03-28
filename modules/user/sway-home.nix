{ config, lib, pkgs, ... }: {
  wayland.windowManager.sway = {
    enable = true;
    package = null;
    wrapperFeatures.base = true;
    wrapperFeatures.gtk = true;
    config = rec {
      modifier = "Mod4";
      fonts = {
        names = ["monospace"];
        size = 8.0;
      };
     
      terminal = "ghostty";

      floating.modifier = "Mod4";
      
      output = {
        "HDMI-A-1" = {
          mode = "1920x1080@74.97Hz";
          pos = "0 0";
        };
        "eDP-1" = {
          pos = "0 0";
        };
        "*" = {
          bg = "#000000 solid_color";
        };
      };
      
      input = {
        "*" = {
          accel_profile = "flat";
          pointer_accel = "0";
        };
        "1267:12739:ELAN050B:00_04F3:31C3_Touchpad" = {
          dwt = "enabled";
          tap = "disabled";
          natural_scroll = "enabled";
          scroll_factor = "0.2";
          clickfinger_button_map = "lrm";
          middle_emulation = "enabled";
        };
      };
      
      keybindings = let
        modifier = config.wayland.windowManager.sway.config.modifier;
      in {
        "XF86AudioRaiseVolume" = "exec --no-startup-id wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioLowerVolume" = "exec --no-startup-id wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioMute" = "exec --no-startup-id wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioMicMute" = "exec --no-startup-id wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
        
        "XF86MonBrightnessUp" = "exec --no-startup-id brightnessctl set 25%+";
        "XF86MonBrightnessDown" = "exec --no-startup-id brightnessctl set 25%-";
        
        "${modifier}+t" = "exec ghostty";
        "${modifier}+b" = "exec firefox";
        "${modifier}+d" = "exec rofi -show drun";
        
        "${modifier}+Shift+q" = "kill";
        "${modifier}+f" = "fullscreen toggle";
        "${modifier}+Shift+minus" = "move scratchpad";
        "${modifier}+minus" = "scratchpad show";
        "${modifier}+Shift+equal" = "floating toggle";
        
        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";
        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";
        
        "${modifier}+Shift+c" = "reload";
        "${modifier}+Shift+r" = "restart";
      };
      
      bars = [
        {
          command = "waybar";
        }
      ];
    };
    
    extraConfig = ''
      # External Executables
      exec dex --autostart --environment sway
      exec sway-audio-idle-inhibit
      exec nm-applet --indicator
    '';
  };

  services = {
    swayidle = {
      enable = true;
      package = pkgs.swayidle;
      timeouts = [
        {
          timeout = 300;
          command = "${pkgs.swaylock-effects}/bin/swaylock";
        }
      ];
      events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock-effects}/bin/swaylock";
      }
      ];
    };
  };

  
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        height = 30;
        modules-left = ["sway/workspaces" "sway/mode"];
        modules-center = [];
        modules-right = ["pulseaudio" "network" "custom/cpu_gpu_temp" "memory" "temperature" "battery" "clock"];
        
        pulseaudio = {
          format = "VOL: {volume}%";
          format-muted = "MUTED";
          interval = 1;
        };
        
        battery = {
          format = "| BAT: {capacity}%";
          interval = 30;
        };
        
        network = {
          format-wifi = "| W: (ESSID: {essid}, Bit Rate: {signalStrength}%, Signal: {signalStrength}%)";
          format-disconnected = "Disconnected";
          interval = 5;
        };
        
        temperature = {
          critical-threshold = 80;
          format = "| TEMP: {temperatureC}°C {icon}";
        };
        
        memory = {
          format = "| MEM: {used}/{total}";
          interval = 10;
        };
        
        clock = {
          format = "| {:%Y-%m-%d %H:%M:%S}";
          interval = 1;
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

  home.packages = with pkgs; [
    rofi-wayland
    waybar
    dex
  ];
}
