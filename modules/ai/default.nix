{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
with builtins; let
  cfg = config.vim.ai;
in {
  options.vim = {
    ai = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "enable OpenAI support through ai.nvim";
      };
    };
  };

  config =
    mkIf cfg.enable
    {
      vim.startPlugins = [
        "ai"
      ];
    };
}

