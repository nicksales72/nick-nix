{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    ghostty.url = "github:clo4/ghostty-hm-module";
  };

  outputs = { self, nixpkgs, home-manager, ghostty, ... }:
    let 
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [ ./hosts/nick/configuration.nix ];
      };
    };
    homeConfigurations = {
      nick = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/nick/home.nix 
                    ghostty.homeModules.default
        ];
      };
    };
  };
}
