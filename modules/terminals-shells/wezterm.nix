{ pkgs, config, ... }: {
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      config.front_end = "WebGpu"

      return config
    '';
  };
}

