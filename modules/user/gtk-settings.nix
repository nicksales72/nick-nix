{ pkgs, ... }: {
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    cursorTheme = {
      name = "rose-pine-cursor";
      package = pkgs.rose-pine-cursor;
    };
  };
  
  home.packages = with pkgs; [ dconf ];
}
