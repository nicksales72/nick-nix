{ pkgs, config, ... }: {
  programs.ghostty = {
    enable = true;
    settings = {
      background = "1e1e1e";
      cursor-style = "block";
      cursor-style-blink = "false";
      shell-integration-features = "no-cursor";
      font-size = "10";
    };
  };
}
