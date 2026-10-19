{ inputs, pkgs, ... }: {
  imports = [
    inputs.zen-browser.homeModules.beta
  ];


  programs.zen-browser = {
    enable = true;

    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };

    profiles.default = {
      presets.betterfox.enable = true;      

      settings = {
        "zen.tabs.ctrl-tab.ignore-essential-tabs" = true;
        "zen.urlbar.behavior" = "float";
        "zen.urlbar.open-on-startup" = false;
        "zen.view.draggable-sidebar" = false;
        "zen.welcome-screen.seen" = true;
      };

      spacesForce = true;
      pins = {
        "Reddit" = {
          id = "ec8311cc-e495-4921-b043-b839105cec67";
          url = "https://reddit.com/";
          position = 100;
          isEssential = true;
        };
        "Twitter" = {
          id = "65ce0bd4-18b9-4208-b7f9-4d6cfdf5ba17";
          url = "https://x.com/";
          position = 101;
          isEssential = true;
        };
      };
      spaces = {
        "Personal" = {
          id = "4bfb839f-766a-49ff-81be-92a3e0e5e55c";
          position = 1000;

          pins = {

          };
        };

        "Study" = {
          id = "9fe4e0e3-2c8f-4873-8bc4-12c0b3bf2dad";
          position = 2000;

          pins = {
          };
        };
      };

      search = {
        force = true;
        default = "google";

        engines = {
          nix-packages = {
            name = "Nix Pkgs";
            urls = [
              {
                template = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}";
              }
            ];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@pkgs" ];
          };

          nix-options = {
            name = "Nix Options";
            urls = [
              {
                template = "https://search.nixos.org/options?channel=unstable&query={searchTerms}";
              }
            ];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@opts" ];
          };

          nixos-wiki = {
            name = "Nix Wiki";
            urls = [
              {
                template = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
              }
            ];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@wiki" ];
          };
        };
      };

      bookmarks = {
        force = true;

        settings = [
          {
            name = "Bookmarks Toolbar";
            toolbar = true;
            bookmarks = [
              {
                name = "Nix Sites";
                bookmarks = [
                  {
                    name = "homepage";
                    url = "https://nixos.org/";
                  }
                  {
                    name = "wiki";
                    url = "https://wiki.nixos.org/";
                  }
                  {
                    name = "packages";
                    url = "https://search.nixos.org/packages";
                  }
                  {
                    name = "options";
                    url = "https://search.nixos.org/options";
                  }
                ];
              }
            ];
          }
        ];
      };

      extensions = {
        packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
          ublock-origin
          darkreader
          sponsorblock
        ];
      };

      mods = [
        "b51ff956-6aea-47ab-80c7-d6c047c0d510"
        "e122b5d9-d385-4bf8-9971-e137809097d0"
        "253a3a74-0cc4-47b7-8b82-996a64f030d5"
        "7190e4e9-bead-4b40-8f57-95d852ddc941"
        "c6813222-6571-4ba6-8faf-58f3343324f6"
        "c8d9e6e6-e702-4e15-8972-3596e57cf398"
        "d8b79d4a-6cba-4495-9ff6-d6d30b0e94fe"
      ];
    };
  };
}
