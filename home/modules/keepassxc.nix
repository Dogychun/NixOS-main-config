{
  pkgs,
  lib,
  ...
}: {
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

  systemd.user.services.rclone-keepass-sync = {
    Unit = {
      Description = "Two-way sync KeePass folder with Dropbox via rclone";
      After = ["network-online.target"];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.rclone}/bin/rclone bisync %h/Dropbox/KeePass dropbox:KeePass --conflict-resolve newer --conflict-loser num";
    };
  };

  systemd.user.timers.rclone-keepass-sync = {
    Unit = {
      Description = "Run rclone KeePass sync every 5 minutes";
    };
    Timer = {
      OnBootSec = "1m";
      OnUnitActiveSec = "5m";
      Persistent = true;
    };
    Install = {
      WantedBy = ["timers.target"];
    };
  };

  home.activation.makeKeepassxcConfigWritable = lib.hm.dag.entryAfter ["linkGeneration"] ''
    cfg="$HOME/.config/keepassxc/keepassxc.ini"
    if [ -L "$cfg" ]; then
      cp --remove-destination "$(readlink -f "$cfg")" "$cfg"
      chmod u+w "$cfg"
    fi
  '';
}
