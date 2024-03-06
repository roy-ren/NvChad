local M = {}

-- M.ui = require "custom.ui"
M.ui = {
  theme = "xcode",

  statusline = {
    theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
  },

  tabufline = {
    lazyload = true,
    overriden_modules = nil,
  },
}

M.plugins = "custom.plugs"

return M
