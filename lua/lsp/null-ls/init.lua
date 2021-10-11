local null_ls = require('null-ls')
local lspconfig = require('lspconfig')
local on_attach = require('partials.lspconfig').on_attach

local sources = {
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.diagnostics.eslint_d,
  null_ls.builtins.formatting.prettierd,
}

null_ls.config({ sources = sources })

lspconfig['null-ls'].setup({ on_attach = on_attach, autostart = true })
