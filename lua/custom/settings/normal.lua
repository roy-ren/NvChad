local M = {}

M.setup = function()
  local opt = vim.opt

  vim.o.guifont = "FiraCode_Nerd_Font:h25"
  -- vim.o.guifont = "D2CodingLigature_Nerd_Font:h19"
  -- vim.o.guifont = "FantasqueSansM_Nerd_Font:h19"
  -- vim.o.guifont = "SauceCodePro_Nerd_Font:h19"
  -- vim.o.guifont = "FiraMono_Nerd_Font:h29"
  vim.wo.relativenumber = true

  opt.linespace = 4
  vim.g.dap_virtual_text = true
end

return M
