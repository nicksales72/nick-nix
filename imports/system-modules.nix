{ lib, ... }: {
  imports = [
    ../modules/tlp.nix
    ../modules/pipewire.nix
    ../modules/nix.nix
    ../modules/amd.nix
    ../modules/haskell.nix
    ../modules/sway.nix
    ../modules/users.nix
  ];
}
