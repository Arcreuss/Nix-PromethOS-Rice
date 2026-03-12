{
  description = "PromethOS : NixOS configuration with Home Manager + Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    yt-x.url = "github:Benexl/yt-x";
  };

  outputs = { self, nixpkgs, home-manager, yt-x, ... }@inputs:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.promethos-desktop = nixpkgs.lib.nixosSystem {
      inherit system;
      
      # Permet d'utiliser inputs dans les modules NixOS si besoin
      specialArgs = { inherit inputs; };

      modules = [
        ./hosts/promethos-desktop/configuration.nix

        home-manager.nixosModules.home-manager

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          
          # Permet d'utiliser inputs dans les modules Home-Manager
          home-manager.extraSpecialArgs = { inherit inputs system; };
          
          home-manager.users = {
            arcreuss = import ./hosts/promethos-desktop/home.nix;
            # foo = import ./home/foo.nix; # add new user to the user map
          };
        }
      ];
    };
  };
}

