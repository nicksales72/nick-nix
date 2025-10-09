{ pkgs, ... }: {
  users.users.nick = {
    isNormalUser = true;
    shell = "${pkgs.nushell}/bin/nu";
    extraGroups = [ "wheel" "networkmanager" "docker" "video" ];
    packages = with pkgs; [ tree feh wget zip unzip clang neovim systemd brave mpv git gcc gnumake cmake ghc jdk nodejs fastfetch ];
  };
}

