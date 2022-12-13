local mason_status, mason = pcall(require, 'mason')
local mason_lspconfig_status, mason_lspconfig = pcall(require, 'mason-lspconfig')

if not mason_status then
  print('mason is not installed')
  return
end

if not mason_lspconfig_status then
  print('mason-lspconfig is not installed')
  return
end

mason.setup()
mason_lspconfig.setup()
