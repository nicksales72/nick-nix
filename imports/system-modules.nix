{ lib, ... }: {
  imports = [
    ../modules/services/pipewire.nix
    ../modules/services/nix.nix
    ../modules/hardware/nvidia.nix
    ../modules/hardware/steam.nix
    ../modules/users/users.nix
    ../modules/wm/kde.nix
  ];
}
