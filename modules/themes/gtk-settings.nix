{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    gnome-themes-extra
  ];

  xdg.configFile."gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-theme-name = Adwaita-dark
  '';

  xdg.configFile."gtk-4.0/settings.ini".text = ''
    [Settings]
    gtk-theme-name = Adwaita-dark
  '';
}
