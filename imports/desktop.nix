{ lib, ... }: {
  imports = [
    ../modules/helix.nix
    ../modules/i3blocks.nix
    ../modules/git.nix
    ../modules/gtk-settings.nix
    ../modules/alacritty.nix
    ../modules/nushell.nix
    ../modules/tmux.nix
  ];
}

