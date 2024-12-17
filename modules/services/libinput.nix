{ config, lib, pkgs, ... }: {
  services.libinput = {
    enable = true;
    mouse.accelProfile = "flat";
    touchpad = {
      accelProfile = "flat";
      disableWhileTyping = true;
      naturalScrolling = true;
      tapping = false;
    };
  };
}

