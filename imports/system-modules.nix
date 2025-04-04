{ ... }: {
  imports = [
    ../modules/system/amd.nix
    ../modules/system/nix.nix
    ../modules/system/pipewire.nix
    ../modules/system/sway.nix
    ../modules/system/tlp.nix
    ../modules/system/users.nix
  ];
}
