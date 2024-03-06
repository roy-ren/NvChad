local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "jose-elias-alvarez/null-ls.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    require "plugins.configs.lspconfig"
    require "custom.plugs.configs.overrides.lsp"
  end,
}

return M
