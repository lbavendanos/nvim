local lspconfig = require('lspconfig')
local on_attach = require('plugins.lspconfig').on_attach
local eslint = require('lsp.linters.eslint')
local prettier = require('lsp.formatters.prettier')

lspconfig.diagnosticls.setup {
  on_attach = on_attach,
  filetypes = {
    'javascript',
    'typescript',
    'javascriptreact',
    'typescriptreact',
    'vue',
    'html',
    'css',
    'sass',
    'scss',
    'less',
    -- "lua",
  },
  init_options = {
    linters = {
      eslint = eslint
    },
    formatters = {
      prettier = prettier,
      -- luafmt = {
      --   command = 'luafmt',
      --   args = {'--indent-count', 2, '--stdin'}
      -- }
    },
    filetypes = {
      javascript = 'eslint',
      typescript = 'eslint',
      javascriptreact = 'eslint',
      typescriptreact = 'eslint',
      vue = 'eslint'
    },
    formatFiletypes = {
      javascript = 'prettier',
      typescript = 'prettier',
      javascriptreact = 'prettier',
      typescriptreact = 'prettier',
      vue = 'prettier',
      html = 'prettier',
      css = 'prettier',
      sass = 'prettier',
      scss = 'prettier',
      less = 'prettier',
      -- lua = 'luafmt'
    },
  }
}
