{ lib, ... }: {
  imports = [
    ./tlp.nix
    ./pipewire.nix
    ./libinput.nix
    ./nvidia.nix
    ./steam.nix
    ./i3.nix
  ];
}
