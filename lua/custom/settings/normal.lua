local M = {}

M.setup = function()
  vim.opt.linespace = 4
  vim.wo.relativenumber = true
  vim.g.dap_virtual_text = true
  vim.o.guifont = "FiraCode_Nerd_Font:h18"
end

return M
