{ pkgs, config, ... }: {
  programs.ghostty = {
    enable = true;
    settings = {
      background = "181818";
      cursor-style = "block";
      cursor-style-blink = "false";
      shell-integration-features = "no-cursor";
      font-size = "10";
    };
  };
}
