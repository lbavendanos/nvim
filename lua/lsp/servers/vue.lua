local lspconfig = require('lspconfig')
local on_attach = require('partials.lspconfig').on_attach
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.vuels.setup({
  on_attach = on_attach,
  init_options = { config = { vetur = { completion = { autoImport = true } } } },
  capabilities = capabilities,
})
