{
  description = "System Configuation";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-25.05";
    };

    nixpkgs-unstable = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
    };

    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: let
    user = "user";

    hosts = [
      { hostname = "g14"; stateVersion = "25.05"; system = "x86_64-linux"; }
    ];

    makeSystem = { hostname, stateVersion, system }: nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = {
        inherit inputs stateVersion hostname user;
        system = system;
        nixos-hardware = inputs.nixos-hardware;
        disko = inputs.disko;
        home-manager = inputs.home-manager;
      };
      modules = [
        ./hosts/${hostname}/configuration.nix
      ];
    };

    makeHome = host: home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${host.system};
      extraSpecialArgs = {
        inherit inputs user;
        stateVersion = host.stateVersion;
      };
      modules = [
        ./home-manager/home.nix
      ];
    };

  in {
    nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
      configs // {
        "${host.hostname}" = makeSystem host;
      }) {} hosts;

    homeConfigurations = nixpkgs.lib.foldl' (homes: host:
      homes // {
        "${host.hostname}" = makeHome host;
      }) {} hosts;
  };
}

