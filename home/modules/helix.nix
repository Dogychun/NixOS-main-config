{ pkgs, ... }: {

  programs.helix = {
    enable = true;

    settings = {
      theme = "gruvbox";

      editor = {
        scrolloff = 10;
        mouse = false;
        line-number = "relative";
        cursorline = true;
        completion-timeout = 5;

        statusline = {

          left = [
            "mode"
            "read-only-indicator"
          ];
          center = [
            "file-absolute-path"
            "file-modification-indicator"
          ];
          right = [
            "diagnostics"
            "selections"
            "position"
          ];

          mode.normal = "NORMAL";
          mode.insert = "INSERT";
          mode.select = "SELECT";
        };

        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "block";
        };

      };
    };
  };

  home.packages = with pkgs; [
    vscode-css-languageserver
    superhtml
    ty
    ruff
    python314Packages.jedi-language-server
    python314Packages.python-lsp-server
  ];
}
