{ config, pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [
    grim     
    slurp 
    wl-clipboard 
    mako
    brightnessctl
    ddcutil        
    i2c-tools      
    swaylock
    swayidle
    sway-audio-idle-inhibit
  ];

  hardware.i2c.enable = true;

  services.gnome.gnome-keyring.enable = true;

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}

