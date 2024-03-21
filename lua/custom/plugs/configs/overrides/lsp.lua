---@diagnostic disable: different-requires
local configs = require "plugins.configs.lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"

local servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "ruby_ls",
  "lua_ls",
  "yamlls",
  "tailwindcss",
}

local util = require "lspconfig/util"

for _, lsp in ipairs(servers) do
  if "tsserver" == lsp then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = function(...)
        return util.root_pattern ".git" (...)
      end,
      single_file_support = false,
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "literal",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = false,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
      },
    }
  elseif "tailwindcss" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = function(...)
        return util.root_pattern ".git" (...)
      end,
    }
  elseif "yamlls" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        yaml = {
          keyOrdering = false,
        },
      },
    }
  else
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end

lspconfig["sourcekit"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp",
  },
  root_dir = function(filename, _)
    return util.root_pattern "buildServer.json" (filename)
        or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
        or util.find_git_ancestor(filename)
        or util.root_pattern "Package.swift" (filename)
  end,
}
