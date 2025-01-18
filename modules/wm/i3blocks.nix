{ config, pkgs, lib, ... }: {
  home.file = {
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
      command=~/bin/cpu_gpu_temp.sh
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

    "bin/cpu_gpu_temp.sh" = {
      text = ''
        #!/bin/bash

        set -euo pipefail

        cpu_temp=$(sensors | grep "Tctl" | awk -F':' '{print $2}' | awk -F'(' '{print $1}' | tr -d '+' | sed 's/^ *//;s/ *$//')

        gpu_temp=$(sensors | grep "edge:" | awk -F':' '{print $2}' | awk -F'(' '{print $1}' | tr -d '+' | sed 's/^ *//;s/ *$//')

        echo "CPU: $cpu_temp GPU: $gpu_temp"
      '';
      executable = true;
    };
  };

  home.packages = with pkgs; [
    acpi
    lm_sensors
  ];
}
