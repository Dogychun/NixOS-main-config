{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    ungoogled-chromium
    qutebrowser

    hyprpicker
    btop
    feh
    python3
    brightnessctl
    elephant
    libnotify
    tree
    wiremix

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
