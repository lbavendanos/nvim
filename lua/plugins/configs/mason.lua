local mason_status, mason = pcall(require, 'mason')
local mason_lspconfig_status, mason_lspconfig = pcall(require, 'mason-lspconfig')
local mason_null_ls_status, mason_null_ls = pcall(require, 'mason-null-ls')

if not mason_status then
  print('mason is not installed')
  return
end

if not mason_lspconfig_status then
  print('mason-lspconfig is not installed')
  return
end

if not mason_null_ls_status then
  print('mason-null-ls is not installed')
  return
end

mason.setup()
mason_lspconfig.setup({
  ensure_installed = {
    'sumneko_lua',
    'vimls',
    'intelephense',
    'tsserver',
    'jsonls',
    'html',
    'cssls',
    'emmet_ls',
    'tailwindcss',
  },
})

mason_null_ls.setup({
  ensure_installed = { 'stylua', 'eslint_d', 'prettierd', 'phpcsfixer' },
})
