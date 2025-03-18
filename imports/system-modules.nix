{ lib, ... }: {
  imports = [
    ../modules/tlp.nix
    ../modules/pipewire.nix
    ../modules/libinput.nix
    ../modules/nix.nix
    ../modules/hardware.nix
    ../modules/python.nix
    ../modules/haskell.nix
    ../modules/i3.nix
    ../modules/users.nix
  ];
}
