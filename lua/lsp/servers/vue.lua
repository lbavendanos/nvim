local lspconfig = require('lspconfig')
local on_attach = require('partials.lspconfig').on_attach

lspconfig.vuels.setup({
  on_attach = on_attach,
  init_options = { config = { vetur = { completion = { autoImport = true } } } },
})
