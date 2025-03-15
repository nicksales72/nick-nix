{ lib, ... }: {
  imports = [
    ../modules/helix.nix
    ../modules/i3blocks.nix
    ../modules/ghostty.nix
    ../modules/tmux.nix
    ../modules/spotify.nix
    ../modules/git.nix
    ../modules/gtk-settings.nix
  ];
}

