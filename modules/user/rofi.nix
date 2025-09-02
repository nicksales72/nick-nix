{ pkgs, ... }: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland-unwrapped;
    theme = "android_notification";
  };
}
