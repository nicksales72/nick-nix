{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "gruber-darker";
      editor = {
        line-number = "relative";
        soft-wrap = {
          enable = true;
        };
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };      
      keys.normal = {
        C-t = ":sh tectonic main.tex";
      };
    };
    extraPackages = with pkgs; [
      # lsps
      haskell-language-server
      jdt-language-server
      rust-analyzer-unwrapped
      texlab
      ruff
      tectonic
      nil
    ];
  };
}
