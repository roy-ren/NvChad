local M = {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
    "neovim/nvim-lspconfig",
  },
  config = true,
  -- config = function()
  --   require("flutter-tools").setup {
  --     on_attach = require("plugins.configs.lspconfig").on_attach,
  --     capabilities = require("plugins.configs.lspconfig").capabilities,
  --   }
  -- end,
}

return M
