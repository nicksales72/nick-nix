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

  boot.initrd.luks.devices."luks-7ba6e4fa-19f6-4f9b-99a1-d0b939042793".device = "/dev/disk/by-uuid/7ba6e4fa-19f6-4f9b-99a1-d0b939042793";
}
