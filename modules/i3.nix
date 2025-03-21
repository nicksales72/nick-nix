{ config, pkgs, ... }: {
  services.xserver.windowManager.i3 = {
    enable = true;

    extraPackages = with pkgs; [
      rofi
      i3blocks
      brightnessctl
    ];

    configFile = pkgs.writeText "i3-config" ''
      # General Settings
      set $mod Mod4
      font pango:monospace 8
      default_orientation horizontal

      # External Executables
      exec --no-startup-id /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
      exec --no-startup-id dex --autostart --environment i3
      exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork
      exec --no-startup-id nm-applet

      # Refresh i3blocks/i3status
      set $refresh_i3status killall -SIGUSR1 i3status

      # Keyboard Shortcuts
      ## Volume Controls
      bindsym XF86AudioRaiseVolume exec --no-startup-id wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ && $refresh_i3status
      bindsym XF86AudioLowerVolume exec --no-startup-id wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && $refresh_i3status
      bindsym XF86AudioMute exec --no-startup-id wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && $refresh_i3status
      bindsym XF86AudioMicMute exec --no-startup-id wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle && $refresh_i3status

      ## Brightness Controls
      bindsym XF86MonBrightnessUp exec --no-startup-id brightnessctl set 25%+
      bindsym XF86MonBrightnessDown exec --no-startup-id brightnessctl set 25%-

      ## Launch Applications
      bindsym $mod+t exec ghostty
      bindsym $mod+b exec nvidia-offload chromium
      bindsym $mod+d exec rofi -show drun

      ## Window Management
      floating_modifier $mod
      bindsym $mod+Shift+q kill
      bindsym $mod+f fullscreen toggle
      bindsym $mod+Shift+minus move scratchpad
      bindsym $mod+minus scratchpad show
      bindsym $mod+Shift+plus floating toggle

      ## Focus and Movement
      bindsym $mod+h focus left
      bindsym $mod+j focus down
      bindsym $mod+k focus up
      bindsym $mod+l focus right
      bindsym $mod+Shift+h move left
      bindsym $mod+Shift+j move down
      bindsym $mod+Shift+k move up
      bindsym $mod+Shift+l move right

      ## System Controls
      bindsym $mod+Shift+c reload
      bindsym $mod+Shift+r restart
      bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"

      # Resize Mode
      mode "resize" {
          bindsym j resize shrink width 10 px or 10 ppt
          bindsym k resize grow height 10 px or 10 ppt
          bindsym l resize shrink height 10 px or 10 ppt
          bindsym semicolon resize grow width 10 px or 10 ppt
          bindsym Left resize shrink width 10 px or 10 ppt
          bindsym Down resize grow height 10 px or 10 ppt
          bindsym Up resize shrink height 10 px or 10 ppt
          bindsym Right resize grow width 10 px or 10 ppt
          bindsym Return mode "default"
          bindsym Escape mode "default"
          bindsym $mod+r mode "default"
      }
      bindsym $mod+r mode "resize"

      # Display and Background Settings
      exec --no-startup-id xrandr --output HDMI-A-0 --mode 1920x1080 --rate 74.97 --same-as eDP --primary
      exec --no-startup-id xsetroot -solid "#000000"

      # Bar Configuration
      bar {
          status_command i3blocks
      }
    '';
  };
}

