{ config, pkgs, ... }: {
  services = {
    xserver.enable = true;
    desktopManager.plasma6.enable = true;
    displayManager = {
      sddm.wayland.enable = true;
      defaultSession = "plasma";
    };
  };
}
