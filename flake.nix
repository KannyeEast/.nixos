{
  description = ''
    Personal dotfiles for using Hyprland via Caelestia/QuickShell on NixOS.
    Intended to be modular for easy customizability.
  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
  };

  outputs = inputs@{ nixpkgs, ... }:
  {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          {
            nixpkgs.overlays = [ ];
            _module.args = { inherit inputs; };
          }

          {
            environment.systemPackages = [
	      
            ];
          }

          inputs.home-manager.nixosModules.home-manager
          ./hosts/desktop/configuration.nix
        ];
      };
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          {
            nixpkgs.overlays = [ ];
            _module.args = { inherit inputs; };
          }

          {
            environment.systemPackages = [
	      
            ];
          }

          inputs.home-manager.nixosModules.home-manager
          ./hosts/laptop/configuration.nix
        ];
      };
    };
  };
}
