{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    chromium
    tutanota-desktop
    rclone

    hyprpicker
    btop
    feh
    python3
    brightnessctl
    elephant
    libnotify
    tree
    wiremix
    pipes
    bonsai

    kdePackages.dolphin
    qbittorrent

    vial

    spotify
    spotifyd

    bibata-cursors

    lutris
    heroic

    grim
    slurp
    swappy
    wl-clipboard
  ];
}
