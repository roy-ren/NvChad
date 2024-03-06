local configs = {
  "custom.settings.normal",
  "custom.settings.neovide",
  "custom.settings.pod",
  "custom.settings.mappings",
}

for _, config in ipairs(configs) do
  local ok, module = pcall(require, config)
  if ok then
    module.setup()
  end
end
