{ pkgs, config, ... }: {
  programs.wezterm = {
    enable = true;
    colorSchemes = {
      theme = {
        background = "#282828";
      };
    };
  };
}

