local on_attach = require('partials.lspconfig').on_attach

require('flutter-tools').setup { lsp = { on_attach = on_attach } }
