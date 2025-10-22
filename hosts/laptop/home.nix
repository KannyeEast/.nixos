{ pkgs, config, ... }:
{
    imports = [
        # User Specific Config
        ./variables.nix

        # System
        ../../home/system/hyprland
        ../../home/system/cursor
        ../../home/system/fish-shell
        ../../home/system/git
        ../../home/system/development

        # Programs
	    ../../home/programs/caelestia
        ../../home/programs/alacritty
        ../../home/programs/keepassxc
        ../../home/programs/zen-browser
        ../../home/programs/spotify
    ];

    home = {
        # Set the home directory path for our user
        inherit (config.var) username;
        homeDirectory = "/home/" + config.var.username;

        # Packages
        packages = with pkgs; [
            # Apps
            # brave

            # Utilities
            grc
            zip
            unzip
            btop
            gtk3

            # Shell/Terminal
            fish
            zsh
            oh-my-posh
            tmux

            fzf
            tree
            tldr
            stow
            zoxide

            # Misc
            cava
            bluez
            ddcutil
            brightnessctl
            imagemagick

            pkg-config
        ];

        # State version - don't touch this
        stateVersion = "24.11";
    };

    # Enable Home Manager
    programs.home-manager = {
        enable = true;
    };
}
