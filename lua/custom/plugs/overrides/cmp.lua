---@diagnostic disable: different-requires
-- local opts = {
--   sources = {
--     -- { name = "copilot" },
--     { name = "nvim_lsp" },
--     { name = "luasnip" },
--     { name = "buffer" },
--     { name = "nvim_lua" },
--     { name = "path" },
--   },
-- }

local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- "zbirenbaum/copilot-cmp",
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  opts = function()
    local M = require "plugins.configs.cmp"
    M.completion.completeopt = "menu,menuone"

    local cmp = require "cmp"
    M.mapping["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = false,
    }
    table.insert(M.sources, { name = "crates" })
    return M
  end,
}

return M
