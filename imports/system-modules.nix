{ lib, ... }: {
  imports = [
    ../modules/system/tlp.nix
    ../modules/system/pipewire.nix
    ../modules/system/nix.nix
    ../modules/system/amd.nix
    ../modules/system/haskell.nix
    ../modules/system/sway.nix
    ../modules/system/users.nix
  ];
}
