{ pkgs, ... }: {
  programs.nixvim = {
    plugins.lspconfig.enable = true;

    lsp = {
      servers."*" = {
        config = {

        };
      };

      servers = {
        nixd.enable = true;

        pyright.enable = true;
        ruff.enable = true;
      };
    };

    plugins.conform-nvim = {
      enable = true;
      autoInstall.enable = true;

      settings = {
        formatters_by_ft = {
          python = [ "black" ];
          nix = [ "alejandra" ];
        };

        format_on_save = {
          lsp_format = "fallback";
          timeout_ms = 500;
        };
      };
    };
  };
}
