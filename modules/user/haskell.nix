{ pkgs, ... }: {
  home.packages = with pkgs; [
    cabal-install
    haskell-language-server
  ];
}

