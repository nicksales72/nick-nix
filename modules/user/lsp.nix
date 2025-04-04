{ pkgs, ... }: {
  home.packages = with pkgs; [ 
    haskell-language-server
    texlivePackages.digestif 
    nixd   
    ccls
  ];
}
