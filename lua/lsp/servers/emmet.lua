local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')
local on_attach = require('partials.lspconfig').on_attach
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.textDocument.completion.completionItem.snippetSupport = true

configs.emmet_ls = {
  default_config = {
    -- cmd = { 'emmet-ls', '--stdio' },
    cmd = { 'ls_emmet', '--stdio' },
    filetypes = {
      'html',
      'css',
      'scss',
      'javascript',
      'javascript.jsx',
      'javascriptreact',
      'typescript',
      'typescript.tsx',
      'typescriptreact',
      'haml',
      'xml',
      'xsl',
      'pug',
      'slim',
      'sass',
      'stylus',
      'less',
      'sss',
      'vue',
    },
    -- filetypes = { 'html', 'css' },
    root_dir = function()
      return vim.loop.cwd()
    end,
    settings = {},
  },
}

lspconfig.emmet_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
