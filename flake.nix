{
  description = "NixOS Config from Scratch";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      system = "x86_64-linux";
      user = "aviral";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {

        laptop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit user system inputs pkgs; };
          modules = [
            ./Hosts/laptop/configuration.nix

            # Integrate Home Manager
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${user} = import ./home/${user}/home.nix;
              home-manager.extraSpecialArgs = { inherit user; };
            }
          ];
        };

        server = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit user system inputs pkgs; };
          modules = [
            ./Hosts/server/configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${user} = import ./home/${user}/home.nix;
              home-manager.extraSpecialArgs = { inherit user; };
            }
          ];
        };

        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit user system inputs pkgs; };
          modules = [
            ./Hosts/desktop/configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${user} = import ./home/${user}/home.nix;
              home-manager.extraSpecialArgs = { inherit user; };
            }
          ];
        };

        raspberry = nixpkgs.lib.nixosSystem {
          # Raspberry Pi is usually ARM, not x86_64
          system = "aarch64-linux"; # or "armv7l-linux" depending on model
          specialArgs = { inherit user inputs; };
          modules = [
            ./Hosts/raspberry/configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${user} = import ./home/${user}/home.nix;
              home-manager.extraSpecialArgs = { inherit user; };
            }
          ];
        };

      };
    };
}
