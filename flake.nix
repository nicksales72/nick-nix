{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";  
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";  
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";  
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let 
      lib = nixpkgs.lib;
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      unstable = import nixpkgs-unstable {
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
          extraSpecialArgs = { inherit unstable; }; 
          modules = [
            ./hosts/nick/home.nix
          ];
        };
      };
    };
}
