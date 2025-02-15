{ pkgs, config, unstable, ... }: {
  programs.ghostty = {
    enable = true;
    package = unstable.ghostty;  
    settings = {
      background = "1c1c1c";
    };
  };
}
