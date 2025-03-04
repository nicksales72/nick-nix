{ config, lib, pkgs, ... }: {
  users.users.nick = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ]; 
    packages = with pkgs; [ tree feh wget zip unzip vlc clang helix git
                            gnumake cmake ghc jdk nodejs R fastfetch ];
  };
}

