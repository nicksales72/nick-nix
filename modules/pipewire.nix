{ config, lib, pkgs, ... }:

{
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
}

