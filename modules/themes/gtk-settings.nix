{ config, lib, pkgs, ... }: {
  home.activation = {
    libadwaita-dark-theme = lib.mkAfter ''
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
    '';
  };

  home.file = {
    ".config/gtk-3.0/settings.ini".text = ''
      [Settings]
      gtk-application-prefer-dark-theme = 1
    '';
  };

  home.packages = with pkgs; [
    gnome-themes-extra
    dconf
  ];
}
