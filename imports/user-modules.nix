{ lib, ... }: {
  imports = [
    ../modules/user/sway-config.nix
    ../modules/user/ghostty.nix
    ../modules/user/nushell.nix
    ../modules/user/tmux.nix
    ../modules/user/spotify.nix
    ../modules/user/git.nix
    ../modules/user/gtk-settings.nix
  ];
}

