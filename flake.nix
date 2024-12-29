{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    ghostty.url = "github:clo4/ghostty-hm-module";
  };

  outputs = { self, nixpkgs, home-manager, ghostty, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/nick/configuration.nix ];
      };
    };

    homeConfigurations = {
      nick = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
        modules = [
          ./hosts/nick/home.nix
          ghostty.homeModules.default
        ];
      };
    };
  };
}
