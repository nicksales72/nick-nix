{ pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      input = {
        follow_mouse = 2;
        accel_profile = "flat";
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
          scroll_factor = 0.1;
          tap_button = 3;
          tap_button_delay = 0;
        };
      };

      env = [
        "HYPRCURSOR_THEME,rose-pine-hyprcursor"
        "HYPRCURSOR_SIZE,24"
        "XCURSOR_THEME,rose-pine-hyprcursor"
        "XCURSOR_SIZE,24"
        "NIXOS_OZONE_WL, 1"
      ];

      device = [
        {
          name = "rapoo-rapoo-gaming-device";
          sensitivity = -0.5;
        }
      ];

      monitor = [
        "HDMI-A-1, 1920x1080@74.97, 0x0, 1, mirror, eDP-1"
        "eDP-1, preferred, 0x0, 1"
      ];

      bind = [
        "SUPER_SHIFT, R, exec, hyprctl reload"
        "SUPER_SHIFT, equal, togglefloating"
        "SUPER, Q, killactive"
        "SUPER, F, fullscreen, toggle"

        "SUPER_SHIFT, H, movewindow, l"
        "SUPER_SHIFT, J, movewindow, d"
        "SUPER_SHIFT, K, movewindow, u"
        "SUPER_SHIFT, L, movewindow, r"

        "SUPER, H, movefocus, l"
        "SUPER, J, movefocus, d"
        "SUPER, K, movefocus, u"
        "SUPER, L, movefocus, r"

        "SUPER, B, exec, brave"
        "SUPER, T, exec, ghostty"
        "SUPER, D, exec, rofi -show drun"

        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER_SHIFT, 1, movetoworkspace, 1"
        "SUPER_SHIFT, 2, movetoworkspace, 2"
        "SUPER_SHIFT, 3, movetoworkspace, 3"
        "SUPER_SHIFT, 4, movetoworkspace, 4"

        "SUPER_SHIFT, S, exec, bash -lc 'grim -g \"$(slurp)\" ~/Pictures/$(date +%Y-%m-%d_%H-%M-%S).png'"

        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMicMute,     exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86AudioMute,        exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
        ", XF86MonBrightnessUp,   exec, brightnessctl set +10%"
      ];

      "exec-once" = [
        "waybar"
        "hypridle"
        "hyprpaper"
        "nm-applet --indicator"
        "otd-daemon"
        "dex --autostart --environment hyprland"
        "hyprctl setcursor rose-pine-hyprcursor 24"
      ];
    };
  };

  home.packages = with pkgs; [
    grim slurp brightnessctl wl-clipboard
    hyprcursor hypridle hyprpaper hyprlock 
  ];
}

