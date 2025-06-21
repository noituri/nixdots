 {
  description = "System flake";
  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations = {
      personal = lib.nixosSystem {
        inherit system;
        modules = [ ./profiles/personal/configuration.nix ];
      };
      vm = lib.nixosSystem {
        inherit system;
        modules = [ ./profiles/vm/configuration.nix ];
      };
      homelab = lib.nixosSystem {
        inherit system;
        modules = [ ./profiles/vm/configuration.nix ];
      };
    };
    homeConfigurations = {
      personal = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./profiles/personal/home.nix ];
      };
      vm = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./profiles/vm/home.nix ];
      };
      homelab = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./profiles/vm/home.nix ];
      };
    };
  };
}
