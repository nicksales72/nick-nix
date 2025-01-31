{ pkgs, config, ... }: {
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require 'wezterm'

      return {
        front_end = "WebGpu",
        enable_wayland = false,
        colors = {
          background = "1c1c1c",
        },
      }
    '';
  };
}
