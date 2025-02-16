{ config, pkgs, ... }: {
  services = {
    xserver.enable = true;
    desktopManager.plasma6.enable = true;
    displayManager = {
      sddm.wayland.enable = true;
      defaultSession = "plasma";
    };
  };
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    ark
    dolphin
    elisa
    gwenview
    kate
    plasma-browser-integration
    konsole
    oxygen
  ];
}
