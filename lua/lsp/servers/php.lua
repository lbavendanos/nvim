local lspconfig = require('lspconfig')
local on_attach = require('partials.lspconfig').on_attach

lspconfig.intelephense.setup { on_attach = on_attach }
