{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../imports/system-modules.nix
  ];

  programs.hyprland.enable = true;

  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;  

  time.timeZone = "Canada/Eastern";
  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.logind.settings.Login = {
    HandlePowerKey = "suspend";
    HandlePowerKeyLongPress = "poweroff";
  };

  services.udev.packages = with pkgs; [ vial ];

  services.power-profiles-daemon.enable = false;

  services.printing.enable = true;

  services.openssh.enable = true;

  security.polkit.enable = true;

  system.stateVersion = "25.11";

  boot.initrd.luks.devices."luks-b15f75b9-15d7-4d86-b5f7-9ba7323e909e".device = "/dev/disk/by-uuid/b15f75b9-15d7-4d86-b5f7-9ba7323e909e";
}
