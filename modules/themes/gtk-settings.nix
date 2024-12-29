{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    dconf
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  home.sessionVariables = {
    GTK_THEME = "Adwaita-dark"; 
  };
}
