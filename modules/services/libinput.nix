{ config, lib, pkgs, ... }: {
  services.libinput = {
    enable = true;
    mouse.accelProfile = "flat";
    touchpad = {
      accelProfile = "flat";
      clickMethod = "clickfinger";
      middleEmulation = true;
      disableWhileTyping = true;
      naturalScrolling = true;
      tapping = false;
    };
  };
}

