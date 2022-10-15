local null_ls = require('null-ls')
local on_attach = require('partials.lspconfig').on_attach
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local sources = {
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.diagnostics.eslint_d,
  null_ls.builtins.formatting.prettierd,
  null_ls.builtins.formatting.phpcsfixer,
}

null_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  autostart = true,
  sources = sources,
})
