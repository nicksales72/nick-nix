{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    grim     
    upower
    slurp 
    wl-clipboard 
    mako
    brightnessctl
    swaylock
    swayidle
    sway-audio-idle-inhibit
    wayland-pipewire-idle-inhibit
  ];

  hardware.i2c.enable = true;

  services.gnome.gnome-keyring.enable = true;
  services.upower.enable = true;

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}

