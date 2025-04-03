{ pkgs, config, ... }: {
  programs.ghostty = {
    enable = true;
    settings = {
      background = "1c1c1c";
      cursor-style = "block";
      cursor-style-blink = "false";
      shell-integration-features = "no-cursor";
      font-size = "8";
    };
  };
}
