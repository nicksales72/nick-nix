{ config, lib, pkgs, ... }: {
  users.users.nick = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ]; 
    packages = with pkgs; [ tree wget ];
  };
}

