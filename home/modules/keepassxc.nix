{
  programs.keepassxc = {
    enable = true;

    settings = {
      Browser.Enabled = true;
      GUI = {
        AdvancedSettings = true;
        HidePasswords = true;
        TrayIconAppearance = "monochrome-light";
      };
      Security.LockDatabaseIdle = true;
      Security.LockDatabaseIdleSeconds = 900;
    };
  };
}
