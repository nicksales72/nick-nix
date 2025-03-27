{ lib, ... }: {
  imports = [
    ../modules/user/sway-home.nix
    ../modules/user/helix.nix
    ../modules/user/ghostty.nix
    ../modules/user/nushell.nix
    ../modules/user/tmux.nix
    ../modules/user/spotify.nix
    ../modules/user/git.nix
    ../modules/user/gtk-settings.nix
  ];
}

