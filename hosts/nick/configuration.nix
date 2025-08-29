{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../imports/system-modules.nix
  ];

  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.blacklistedKernelModules = [ "nouveau" ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;  

  time.timeZone = "Canada/Eastern";
  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.udev.packages = with pkgs; [ vial ];

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.power-profiles-daemon.enable = true;

  services.printing.enable = true;

  services.openssh.enable = true;

  security.polkit.enable = true;

  system.stateVersion = "25.11";

  environment.plasma6.excludePackages = with pkgs; [ kdePackages.konsole kdePackages.dolphin kdePackages.elisa kdePackages.kate ];
}
