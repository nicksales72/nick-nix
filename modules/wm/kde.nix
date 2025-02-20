{ config, pkgs, ... }: {
  services = {
    desktopManager.plasma6.enable = true;
    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
      desktopManager.xterm.enable = false;
    };
    displayManager = {
      sddm.wayland.enable = true;
      defaultSession = "plasma";
    };
  };

  environment = {
    systemPackages = with pkgs; [
      wl-clipboard
    ];
    plasma6.excludePackages = with pkgs.kdePackages; [
      ark
      dolphin
      okular
      elisa
      gwenview
      kate
      plasma-browser-integration
      konsole
      oxygen
    ];
  };
}
