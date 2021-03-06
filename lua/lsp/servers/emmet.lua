local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local on_attach = require('partials.lspconfig').on_attach
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

configs.emmet_ls = {
  default_config = {
    cmd = { 'emmet-ls', '--stdio' },
    filetypes = { 'html', 'css' },
    root_dir = function() return vim.loop.cwd() end,
    settings = {}
  }
}

lspconfig.emmet_ls.setup { on_attach = on_attach }
