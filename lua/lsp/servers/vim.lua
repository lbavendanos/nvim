local lspconfig = require('lspconfig')
local on_attach = require('partials.lspconfig').on_attach
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.vimls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
