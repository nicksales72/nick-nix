{ config, lib, pkgs, ... }: {
  users.users.nick = {
    isNormalUser = true;
    shell = "${pkgs.nushell}/bin/nu";
    extraGroups = [ "wheel" "networkmanager" "docker" ]; 
    packages = with pkgs; [ tree feh wget zip unzip vlc clang helix git
                            gcc gnumake cmake ghc jdk nodejs R fastfetch ];
  };
}

