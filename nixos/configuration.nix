{
  imports = [
    ./hardware-configuration.nix
    ./modules/i3.nix
    ./modules/steam.nix
    ./modules/pipewire.nix
    ./modules/tlp.nix
    ./modules/nvidia.nix  
    ./modules/user.nix    
    ./modules/libinput.nix 
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

  services.printing.enable = true;

  services.openssh.enable = true;

  system.stateVersion = "24.11";
}
