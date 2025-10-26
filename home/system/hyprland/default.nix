{ pkgs, config, inputs, lib, ... }:
{
  home.packages = with pkgs; [
    qt5.qtwayland
    qt6.qtwayland
    libsForQt5.qt5ct
    qt6ct

    wayland-utils
    wayland-protocols

    hyprpolkitagent
    hyprshot
    hyprpicker

    wlr-randr
    wl-clipboard

    libva
    dconf
    glib
    direnv

    meson
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    systemd = {
      enable = false;
      variables = [ "--all" ];
    };

    package = null;
    portalPackage = null;
  };
}
