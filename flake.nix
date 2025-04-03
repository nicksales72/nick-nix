{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";  
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";  
  };

  outputs = { nixpkgs, home-manager, ... }:
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
          modules = [ ./hosts/kafka/configuration.nix ];
        };
      };

      homeConfigurations = {
        kafka = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./hosts/kafka/home.nix
          ];
        };
      };
    };
}
