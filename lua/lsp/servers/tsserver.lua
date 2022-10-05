local lspconfig = require('lspconfig')
local on_attach = require('partials.lspconfig').on_attach
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)

    client.server_capabilities.documentFormattingProvider = false
  end,
  capabilities = capabilities,
})
