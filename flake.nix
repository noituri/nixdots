{
  description = "System flake";
  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, zen-browser, ... }:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    inputs = { inherit zen-browser; };
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
        modules = [
          stylix.homeModules.stylix
          ./profiles/personal/home.nix
        ];
        extraSpecialArgs = { inherit inputs; };
      };
      vm = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          stylix.homeModules.stylix
          ./profiles/vm/home.nix
        ];
        extraSpecialArgs = { inherit inputs; };
      };
      homelab = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./profiles/homelab/home.nix ];
        extraSpecialArgs = { inherit inputs; };
      };
    };
  };
}
