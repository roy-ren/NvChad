local M = {}

M.setup = function()
  vim.opt.linespace = 4
  vim.o.guifont = "FiraCode_Nerd_Font:h12"
  vim.wo.relativenumber = true
  vim.g.dap_virtual_text = true
end

return M
