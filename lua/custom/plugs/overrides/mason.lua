local M = {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- lua stuff
      "lua-language-server",
      "stylua",

      -- rust
      "rust-analyzer",

      -- dart
      "dart-debug-adapter",

      -- yaml
      "yamllint",
      "yaml-language-server",

      -- web
      "selene",
      "shellcheck",
      "shfmt",
      "tailwindcss-language-server",
      "typescript-language-server",
      "css-lsp",
    },
  },
}

return M
