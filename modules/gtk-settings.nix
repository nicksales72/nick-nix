{ config, lib, pkgs, ... }: {
  home.file = {
    ".config/gtk-3.0/settings.ini".text = ''
      [Settings]
      gtk-application-prefer-dark-theme = 1
    '';
  };
}

