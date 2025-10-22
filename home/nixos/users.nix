{ config, pkgs, ... }:
let 
  username = config.var.username;
  shell = config.var.shell;
in {
  programs.${shell}.enable = true;

  users = {
    users.${username} = {
      isNormalUser = true;
      description = "${username}";
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.${shell};
    };
  };
}
