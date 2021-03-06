local lspconfig = require('lspconfig')
local on_attach = require('partials.lspconfig').on_attach
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.cssls.setup { on_attach = on_attach, capabilities = capabilities }
