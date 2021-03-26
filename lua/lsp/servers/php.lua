local lspconfig = require('lspconfig')
local on_attach = require('plugins.lspconfig').on_attach

lspconfig.intelephense.setup { on_attach = on_attach }
