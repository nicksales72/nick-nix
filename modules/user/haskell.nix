{ pkgs, ... }: {
  home.packages = with pkgs; [ cabal-install ];
}

