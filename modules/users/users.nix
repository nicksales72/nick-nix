{ config, lib, pkgs, ... }: {
  users.users.nick = {
    isNormalUser = true;
    shell = "${pkgs.nushell}/bin/nu";
    extraGroups = [ "wheel" "networkmanager" "docker" ]; 
    packages = with pkgs; [ tree wget ];
  };
}

