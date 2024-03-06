local M = {}

M.general = require "custom.mappings.control"
M.leader = require "custom.mappings.leader"
M.disabled = require "custom.mappings.disable"
M.custom_lsp = require "custom.mappings.lsp"

return M
