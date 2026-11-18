{
  programs.vesktop = {
    enable = true;

    settings = {
      discordBranch = "stable";
      minimizeToTray = false;
      tray = false;
      harwareAcceleration = true;
      arRPC = true;
      checkUpdates = false;
      disableMinSize = true;
      staticTitle = true;
    };

    vencord = {
      settings = {
        autoUpdate = false;
        autoUpdateNotification = false;
        notifyAboutUpdates = false;
        useQuickCss = true;
        frameless = true;
        transparent = false;

        plugins = {
          ClearURLs.enabled = true;
        };
      };
    };
  };

  services.arrpc.enable = true;

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
