{ config, lib, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    cabal-install
    haskell-language-server
  ];
}

