{ config, pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [
    grim     
    slurp 
    wl-clipboard 
    mako
    brightnessctl
    swaylock
    swayidle
    sway-audio-idle-inhibit
  ];

  services.gnome.gnome-keyring.enable = true;

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}

