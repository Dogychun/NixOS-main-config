{ pkgs, ... }: {
  programs.anyrun = {
    enable = true;

    config = {
      plugins = [
        "${pkgs.anyrun}/lib/libapplications.so"
        "${pkgs.anyrun}/lib/librink.so"
        "${pkgs.anyrun}/lib/libtranslate.so"
        "${pkgs.anyrun}/lib/libshell.so"
      ];

      x.fraction = 0.5;
      y.fraction = 0.3;
      width.fraction = 0.3;
      layer = "overlay";
      hideIcons = false;
      hidePluginInfo = true;
      closeOnClick = true;
      showResultsImmediately = false;
      maxEntries = 8;
    };

    extraCss = ''
      * {
        font-family: "Martian Mono";
        font-size: 14px;
      }

      /* window must be transparent so only the inner box is visible */
      window,
      #window {
        background: transparent;
      }

      /* main box */
      box.main,
      box#main {
        background-color: #282828;
        border: 2px solid #b8bb26;
        border-radius: 0px;
        padding: 0px;
        margin: 0px;
      }

      /* search input */
      text,
      entry#entry {
        background-color: #282828;
        color: #ebdbb2;
        border-radius: 0px;
        padding: 0px;
        min-height: 30px;
      }

      /* results list */
      .matches,
      list#main {
        background: transparent;
      }

      label.match,
      label#match {
        color: #ebdbb2;
      }

      label.match.description,
      label#match-desc {
        color: #a89984;
      }

      row:selected,
      .match:selected,
      #match:selected {
        background-color: #504945;
      }
    '';

    extraConfigFiles = {
      "translate.ron".text = ''
        Config(
          prefix: ":t",
          language_delimiter: ">",
          max_entries: 3,
        )
      '';
      "shell.ron".text = ''
        Config(
        prefix: ":sh",
        shell: None,
      )
      '';
    };
  };
}
