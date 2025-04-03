{ pkgs, ... }: {
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

  hardware.i2c.enable = true;

  services.gnome.gnome-keyring.enable = true;

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}

