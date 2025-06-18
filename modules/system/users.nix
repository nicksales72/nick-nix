{ pkgs, ... }: {
  users.users.nick = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "video" ]; 
    packages = with pkgs; [ tree feh wget zip unzip clang vim systemd chromium
                            mpv git gcc gnumake cmake ghc jdk nodejs R fastfetch ];
  };
}

