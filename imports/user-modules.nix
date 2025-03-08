{ lib, ... }: {
  imports = [
    ../modules/other/i3blocks.nix
    ../modules/other/helix.nix
    ../modules/other/ghostty.nix
    ../modules/other/tmux.nix
    ../modules/other/firefox.nix
    ../modules/other/zathura.nix
    ../modules/linux/git.nix
    ../modules/linux/gtk-settings.nix
  ];
}

