
{ 
    description = "NixOS Config from Sratch";

    inputs = {
        nixpkgs.url = "github:Nixos/nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager/release-25.05";
        home-manager.inputs.nixpkgs.follow = "nixpkgs";
    };

    outputs = { self, nixpkgs, home-manager, ... } @ inputs : 
        let { 
            system = "x86_64-linux";
            user = "aviral";
            pkgs = import nixpkgs {
                inherit system;
                config.allowUnfree = true;
            };
        } in {
            nixosConfigurations {

                laptop = nixpkgs.lib.nixosSystem {
                    specialArgs = { inherit user system inputs; };
                    module = [
                        ./hosts/laptop/configuration.nix
                    ];
                };

                server = nixpkgs.lib.nixosSystem {
                    specialArgs = { inherit user system inputs; };
                    module = [
                        ./hosts/server/configuration.nix
                    ];
                };

                desktop = nixpkgs.lib.nixosSystem {
                    specialArgs = { inherit user system inputs; };
                    module = [
                        ./hosts/desktop/configuration.nix
                    ];
                };

                raspberry = nixpkgs.lib.nixosSystem {
                    specialArgs = { inherit user system inputs; };
                    module = [
                        ./hosts/raspberry/configuration.nix
                    ];
                };

            };
    };
}
