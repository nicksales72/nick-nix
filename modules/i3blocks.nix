{ config, pkgs, lib, ... }: {
  home.file = {
    ".config/i3blocks/config".text = ''
      [volume]
      command=wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print "VOL: " int($2*100) "%"}'
      interval=1
      color=#FFFFFF

      [battery]
      command=acpi -b | grep 'Battery 1' | awk -F', ' '{print "BAT: " $2}' | tr -d '%'
      interval=30
      color=#FFFFFF

      [wireless]
      command=nmcli -t -f IN-USE,SSID,SIGNAL,RATE dev wifi | awk -F ':' '$1=="*" {print "W: (ESSID: " $2 ", Bit Rate: " $4 " Mbps, Signal: " $3 "%)"}'
      interval=5
      color=#FFFFFF

      [cpu_gpu_temperature]
      command=~/bin/cpu_gpu_temp.nu
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

    "bin/cpu_gpu_temp.nu" = {
      text = ''
        #!/usr/bin/env nu

        def main [] {
            let cpu_temp = (
                ^sensors 
                | grep "Tctl" 
                | str trim 
                | split row ":" 
                | get 1 
                | split row "(" 
                | get 0 
                | str trim
                | str replace --all "+" ""
            )

            let gpu_temp = (
                ^sensors 
                | grep "edge:" 
                | str trim 
                | split row ":" 
                | get 1 
                | split row "(" 
                | get 0 
                | str trim
                | str replace --all "+" ""
            )

            print $"CPU: ($cpu_temp) GPU: ($gpu_temp)"
        }
      '';
      executable = true;
    };
  };

  home.packages = with pkgs; [
    acpi
    lm_sensors
  ];
}
