{ config, pkgs, lib, ... }: {
  programs.zathura = {
    enable = true;
    options = {
      zoom-step = 20;
      selection-clipboard = "clipboard";
      incremental-search = true;
    };
  };
}
