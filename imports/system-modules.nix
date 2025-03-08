{ lib, ... }: {
  imports = [
    ../modules/linux/tlp.nix
    ../modules/linux/pipewire.nix
    ../modules/linux/libinput.nix
    ../modules/linux/nix.nix
    ../modules/linux/nvidia.nix
    ../modules/linux/python.nix
    ../modules/linux/i3.nix
    ../modules/other/steam.nix
    ../modules/other/users.nix
  ];
}
