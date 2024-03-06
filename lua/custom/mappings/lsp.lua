local map = vim.keymap.set

map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "LSP declaration" })
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "LSP definition" })
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "LSP hover" })
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "LSP implementation" })
map("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "LSP signature help" })
map("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { desc = "LSP definition type" })
map("n", "<leader>ra", "<cmd>lua require('nvchad.renamer').open()<CR>", { desc = "LSP rename" })
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "LSP code action" })
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "LSP references" })
map("n", "<leader>lf", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Floating diagnostic" })
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Goto prev" })
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Goto next" })
map("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", { desc = "Diagnostic setloclist" })
map("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", { desc = "Add workspace folder" })
map("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", { desc = "Remove workspace folder" })
map(
  "n",
  "<leader>wl",
  "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
  { desc = "List workspace folders" }
)
map("v", "<leader>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", { desc = "LSP code action" })
