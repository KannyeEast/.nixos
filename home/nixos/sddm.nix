{ pkgs, inputs, config, lib, ... }:
let
  foreground = config.theme.textColorOnWallpaper;
  sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "astronaut";
  };
  sddm-wimst = pkgs.where-is-my-sddm-theme.override {
    themeConfig.General = {
      background = toString ../../assets/wallpapers/nix-binary.png;
      backgroundMode = "aspect";
      backgroundFill = "#0000005d";

      showUsersByDefault = true;
      usersFontSize = 24;
      showSessionsByDefault = true;
      
      passwordFontSize = 24;
      passwordInputRadius = 25;
      passwordInputBorderWidth = 2;
      passwordInputBackground = "#60ffffff";
      passwordCursorColor = "#ffffff";
    };
  };
in
{
  services.displayManager = {
    sddm = {
      package = pkgs.kdePackages.sddm;
      extraPackages = with pkgs.kdePackages; [
        # sddm-astronaut
        # where-is-my-sddm-theme
        qtsvg
        qtmultimedia
        qtvirtualkeyboard
        qt5compat
      ];
 
      enable = true;
      wayland.enable = true;

      enableHidpi = true;

      #theme = "sddm-astronaut-theme";
      theme = "where_is_my_sddm_theme";

      settings = {
        Wayland.SessionDir = "${inputs.hyprland.packages."${pkgs.system}".hyprland}/share/wayland-sessions";
      };
    };
  };

  environment.systemPackages = [
    sddm-astronaut
    sddm-wimst
  ];

  # Prevent getting stuck at shutdown
  # systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
