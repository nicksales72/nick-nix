{ lib, ... }: {
  imports = [
    ./helix.nix
    ./i3blocks.nix
    ./git.nix
    ./gtk-settings.nix
  ];
}

