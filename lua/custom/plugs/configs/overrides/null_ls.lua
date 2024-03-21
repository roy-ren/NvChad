local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

null_ls.setup {
  debug = false,
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.dart_format,
    null_ls.builtins.formatting.yamlfmt,
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,
  },
}
