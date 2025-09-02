{ ... }: {
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        ignore_dbus_inhibit = false;
        ignore_systemd_inhibit = false;
      };
      listener = [
        {
          timeout = 1800;
          "on-timeout" = "hyprlock";
        }
        {
          timeout = 1830;
          "on-timeout" = "systemctl suspend";
        }
      ];
    };
  };
}
