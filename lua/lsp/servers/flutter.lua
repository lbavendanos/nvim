local on_attach = require('partials.lspconfig').on_attach
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require('flutter-tools').setup({
  lsp = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
})
