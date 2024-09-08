return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    require('mason').setup()

    require('mason-lspconfig').setup({
      ensure_installed = {
        'lua_ls',
        'vimls',
        'intelephense',
        'ts_ls',
        'svelte',
        'astro',
        'graphql',
        'jsonls',
        'html',
        'cssls',
        'emmet_ls',
        'tailwindcss',
      },
    })

    require('mason-tool-installer').setup({
      ensure_installed = {
        'stylua',
        'eslint',
        'prettierd',
      },
    })
  end,
  cmd = { 'Mason', 'MasonToolsInstall', 'MasonToolsUpdate', 'MasonToolsClean' },
}
