{ config, pkgs, inputs, ... }:
{
    imports = [
        # User Specific Config
        ./variables.nix

        # System
        ../../home/system/hyprland
        ../../home/system/cursor
        ../../home/system/git
        ../../home/system/development

        # Programs with configs
	    ../../home/programs/caelestia
    ];

    home = {
        # Set the home directory path for our user
        inherit (config.var) username;
        homeDirectory = "/home/" + config.var.username;

        # Packages
        packages = with pkgs; [
            # Programs
            spotify
            keepassxc
            alacritty
            inputs.zen-browser.packages.${pkgs.system}.default

            # Utilities
            grc
            zip
            unzip
            btop
            gtk3

            # Shell/Terminal
            # Default shell is set (and installed) in variables.nix
            # zsh

            oh-my-posh
            tmux
            neovim

            fzf
            bat
            eza
            tree
            tldr
            stow
            zoxide

            # Misc
            #cava
            #ddcutil
            #imagemagick
            bluez
            brightnessctl

            pkg-config
        ];

        # State version - don't touch this
        stateVersion = "25.05";
    };

    programs = {
        # Enable Home Manager
        home-manager.enable = true;
    };
}
