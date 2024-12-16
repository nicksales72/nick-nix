{ lib, ... }: {
  imports = [
    ../modules/helix.nix
    ../modules/i3blocks.nix
    ../modules/git.nix
    ../modules/gtk-settings.nix
  ];
}

