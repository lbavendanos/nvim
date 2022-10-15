local lspconfig = require('lspconfig')
local on_attach = require('partials.lspconfig').on_attach
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.intelephense.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
