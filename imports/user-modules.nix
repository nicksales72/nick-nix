{ lib, ... }: {
  imports = [
    ../modules/other/helix.nix
    ../modules/other/i3blocks.nix
    ../modules/other/ghostty.nix
    ../modules/other/tmux.nix
    ../modules/other/firefox.nix
    ../modules/other/spotify.nix
    ../modules/linux/git.nix
    ../modules/linux/gtk-settings.nix
  ];
}

