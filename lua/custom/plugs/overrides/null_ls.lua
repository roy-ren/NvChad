local M = {
  "jose-elias-alvarez/null-ls.nvim",
  ft = {
    "python",
  },
  config = function()
    require "custom.plugs.configs.overrides.null_ls"
  end,
}

return M
