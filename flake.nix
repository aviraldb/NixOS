
{ 
    description = "NixOS Config from Sratch";

    inputs = {
        nixpkgs.url = "github:Nixos/nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager/release-25.05";
        home-manager.inputs.nixpkgs.follow = "nixpkgs";
    };

    outputs = { self, nixpkgs, home-manager, ... } : 
        let 
        system = "x86_64-linux";
    user = "aviral";
    in {
        nixosConfigurations.nixlord = nixpkgs.lib.nixosSystem {
            inherit system;
            module = [
                ./hosts/laptop/configuration.nix

                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.user = import ./hosts/laptop/home.nix;
                        home-manager.backupFileExtension = "backup";
                    };
            ];
        }
    };
}
