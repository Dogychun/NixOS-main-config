{ inputs, pkgs, ... }: {
  programs.librewolf = {
    enable = true;
    package = pkgs.librewolf;

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

      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        "addon@darkreader.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
          installation_mode = "force_installed";
        };
        "soundfixer@unrelenting.technology" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/soundfixer/latest.xpi";
          installation_mode = "force_installed";
        };
        "{3c078156-979c-498b-8990-85f7987dd929}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sidebery/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };

    settings = {
      "middlemouse.paste" = false;
      "permissions.default.desktopnotifications" = 2;
    };

    profiles.dogychun = {
      userChrome = '' 
        #TabsToolbar { display: none !important; }
	#sidebar-panel-header { display: none !important; }
	#sidebar-box { padding-inline-start: 0px !important; }

	* { 
	  border-radius: 0px !important; 
	}
      '';

      search.force = true;
      search.default = "ddg";
      search.privateDefault = "ddg";
      search.engines = {
        ddg = {
          name = "DuckDuckGo";
          urls = [
            {
              template = "https://duckduckgo.com/";
              params = [
                {
                  name = "q";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
          icon = "https://duckduckgo.com/favicon.ico";
          definedAliases = [ "@ddg" ];
        };
        google = {
          name = "Google";
          urls = [
            {
              template = "https://www.google.com/search";
              params = [
                {
                  name = "q";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
          icon = "https://www.google.com/favicon.ico";
          definedAliases = [ "@g" ];
        };
        nix-packages = {
          name = "Nix Pkgs";
          urls = [
            {
              template = "https://search.nixos.org/packages";
              params = [
                {
                  name = "type";
                  value = "packages";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@pkgs" ];
        };

        nix-options = {
          name = "Nix Options";
          urls = [
            {
              template = "https://search.nixos.org/options";
              params = [
                {
                  name = "type";
                  value = "packages";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@opts" ];
        };

        nixos-wiki = {
          name = "NixOS Wiki";
          urls = [
            {
              template = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
            }
          ];

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@wiki" ];
        };
        "DuckDuckGo No-AI".metaData.hidden = true;
        "mojeek".metaData.hidden = true;
        "startpage".metaData.hidden = true;
        "wikipedia".metaData.hidden = true;
      };

      bookmarks = {
        force = true;

        settings = [
          {
            toolbar = true;
            bookmarks = [
              {
                name = "Nix sites";
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
                    name = "search";
                    url = "https://search.nixos.org/";
                  }
                ];
              }
            ];
          }
        ];
      };
    };
  };

}
