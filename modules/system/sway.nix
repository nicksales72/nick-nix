{ config, lib, pkgs, ... }: {
  services.gnome.gnome-keyring.enable = true;
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true; 
    extraPackages = with pkgs; [
      rofi-wayland
      brightnessctl
      waybar
      swaylock
      swayidle
      sway-audio-idle-inhibit
      dex
      wl-clipboard
      mako
      grim
      slurp
    ];
    extraSessionCommands = ''
      export XDG_SESSION_TYPE=wayland
      export XDG_CURRENT_DESKTOP=sway
      export MOZ_ENABLE_WAYLAND=1
      export _JAVA_AWT_WM_NONREPARENTING=1
    '';
  };
}
