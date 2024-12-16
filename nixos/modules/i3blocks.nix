{ config, pkgs, lib, ... }:

{
  home.file = {
    # i3blocks configuration
    ".config/i3blocks/config".text = ''
      [volume]
      command=wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print "VOL: " int($2*100) "%"}'
      interval=1
      color=#FFFFFF

      [battery]
      command=acpi -b | awk -F', ' '{print "BAT: " $2}' | tr -d '%'
      interval=30
      color=#FFFFFF

      [wireless]
      command=nmcli -t -f IN-USE,SSID,SIGNAL,RATE dev wifi | awk -F ':' '$1=="*" {print "W: (ESSID: " $2 ", Bit Rate: " $4 " Mbps, Signal: " $3 "%)"}'
      interval=5
      color=#FFFFFF

      [cpu_gpu_temperature]
      command=~/.local/bin/cpu_gpu_temp.sh
      interval=1
      color=#FFFFFF

      [memory]
      command=free -h | awk '/^Mem/ {print "MEM: " $3 "/" $2}'
      interval=10
      color=#FFFFFF

      [tztime]
      command=date '+%Y-%m-%d %H:%M:%S'
      interval=1
      color=#FFFFFF
    '';

    # Bash script for CPU and GPU temperature
    ".local/bin/cpu_gpu_temp.sh".text = ''
      #!/bin/sh

      # Adjusting the pattern to match the Tctl temperature for CPU
      cpu_temp=$(sensors | grep "Tctl" | awk "{print substr(\$2, 2)}")
      gpu_temp=$(sensors | grep "edge:" | awk "{print substr(\$2, 2)}")
      
      echo "CPU: $cpu_temp GPU: $gpu_temp"
    '';
  };

  # Ensure the script is executable
  home.activation = {
    makeExecutableCpuGpuTemp = lib.hm.dag.entryAfter [ ]
      ''
        chmod +x ${config.home.homeDirectory}/.local/bin/cpu_gpu_temp.sh
      '';
  };
}
