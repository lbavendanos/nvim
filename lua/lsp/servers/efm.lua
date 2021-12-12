local lspconfig = require('lspconfig')
local on_attach = require('partials.lspconfig').on_attach
local eslint = require('lsp.linters.eslint')
local prettier = require('lsp.formatters.prettier')
local luafmt = require('lsp.formatters.luafmt')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local languages = {
  lua = { luafmt },
  typescript = { eslint, prettier },
  javascript = { eslint, prettier },
  typescriptreact = { eslint, prettier },
  ['typescript.tsx'] = { eslint, prettier },
  javascriptreact = { eslint, prettier },
  ['javascript.jsx'] = { eslint, prettier },
  vue = { eslint, prettier },
  yaml = { prettier },
  json = { prettier },
  html = { prettier },
  css = { prettier },
  scss = { prettier },
  markdown = { prettier },
}

lspconfig.efm.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = { documentFormatting = true },
  filetypes = vim.tbl_keys(languages),
  settings = { rootMarkers = { '.git/' }, languages = languages },
})
