{ config, lib, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    cabal-install
    haskell-language-server
    (haskellPackages.ghcWithPackages (ps: with ps; [
      regex-base
      regex-pcre
      regex-tdfa
    ]))
  ];
}

