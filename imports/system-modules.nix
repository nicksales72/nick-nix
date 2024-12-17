{ lib, ... }: {
  imports = [
    ../modules/services/tlp.nix
    ../modules/services/pipewire.nix
    ../modules/services/libinput.nix
    ../modules/hardware/nvidia.nix
    ../modules/hardware/steam.nix
    ../modules/users/users.nix
    ../modules/wm/i3.nix
  ];
}
