{ config, lib, ... }:
{
  config.var = {
    hostname = "laptop";
    username = "gldn";

    shell = "zsh";

    # Upgrade/GC opt-ins
    autoUpgrade = false;
    autoGarbageCollector = true;

    # NixOS config directory
    configDirectory = "/home/" + config.var.username + "/.nixos";

    # Git config
    git = {
      username = "gldn";
      email = "gian-luca@di-natale.de";
    };

    # Locale & Keyboard
    location = "Berlin";
    timeZone = "Europe/Berlin";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "en_US.UTF-8";
    keyboardLayout = "us";
  };

  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = { };
    };
  };
}
