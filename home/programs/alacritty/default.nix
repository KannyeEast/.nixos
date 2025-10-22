{ pkgs, config, lib, ... }:
{
  programs.alacritty = {
    enable = true;
  };

  #xdg.configFile = {
  #  "ghostty/config" = {
  #    source = ./config/config;
  # };
  #  "ghostty/themes/rosepine" = {
  #    source = ./config/themes/rosepine;
  #  };
  #};
}