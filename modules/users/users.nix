{ config, lib, pkgs, ... }: {
  users.users.nick = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ]; 
    packages = with pkgs; [ tree wget zip unzip vlc clang ghc jdk nodejs R ];
  };
}

