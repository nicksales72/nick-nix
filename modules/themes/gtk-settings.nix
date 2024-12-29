{ config, lib, pkgs, ... }: {
  gtk = {
    enable = true;
    # gtk3.extraCss = pkgs.gnome-themes-extra.adwaitaGtkCss;
    # gtk4.extraCss = pkgs.gnome-themes-extra.adwaitaGtkCss;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  home.packages = with pkgs; [
    gnome-themes-extra
    dconf
  ];
}
