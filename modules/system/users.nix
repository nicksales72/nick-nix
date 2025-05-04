{ pkgs, ... }: {
  users.users.kafka = {
    isNormalUser = true;
    shell = "${pkgs.nushell}/bin/nu";
    extraGroups = [ "wheel" "networkmanager" "docker" "video" ]; 
    packages = with pkgs; [ tree feh wget zip unzip clang helix systemd firefox 
                            mpv git gcc gnumake cmake ghc jdk nodejs R fastfetch ];
  };
}

