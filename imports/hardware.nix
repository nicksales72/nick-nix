{ lib, ... }: {
  imports = [
    ../modules/tlp.nix
    ../modules/pipewire.nix
    ../modules/libinput.nix
    ../modules/nvidia.nix
    ../modules/steam.nix
    ../modules/i3.nix
  ];
}
