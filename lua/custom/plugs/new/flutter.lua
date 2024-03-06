local M = {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = function()
    local on_attach = require("plugins.configs.lspconfig").on_attach
    local capabilities = require("plugins.configs.lspconfig").capabilities

    return {
      lsp = {
        on_attach = on_attach,
        capabilities = capabilities,
      },
    }
  end,
  config = function(_, opts)
    require("flutter-tools").setup(opts)
  end,
}

return M
