{ ... }:
{
    imports = [
        # -------------------------------------
        # Profiles :-
        # -------------------------------------
        ../../profiles/laptop.nix
        ../../profiles/workstation.nix

        # Packages : 
        ./packages.nix

        # Modules :
        ./modules.nix

        # Hardware Configuration 
        ./hardware-configuration.nix
    ];

    networking.hostname = "nixLord";
}
