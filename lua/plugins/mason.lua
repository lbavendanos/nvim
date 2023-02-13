return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'jay-babu/mason-null-ls.nvim',
  },
  config = function()
    require('mason').setup()

    require('mason-lspconfig').setup({
      ensure_installed = {
        'lua_ls',
        'vimls',
        'intelephense',
        'tsserver',
        'svelte',
        'astro',
        'jsonls',
        'html',
        'cssls',
        'emmet_ls',
        'tailwindcss',
      },
    })

    require('mason-null-ls').setup({
      ensure_installed = {
        'stylua',
        'eslint_d',
        'prettierd',
      },
    })
  end,
  cmd = 'Mason',
}
