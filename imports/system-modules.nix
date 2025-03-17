{ lib, ... }: {
  imports = [
    ../modules/tlp.nix
    ../modules/pipewire.nix
    ../modules/libinput.nix
    ../modules/nix.nix
    ../modules/nvidia.nix
    ../modules/python.nix
    ../modules/haskell.nix
    ../modules/i3.nix
    ../modules/steam.nix
    ../modules/users.nix
  ];
}
