return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-calc',
    'hrsh7th/cmp-emoji',
    'hrsh7th/cmp-cmdline',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim',
    'roobert/tailwindcss-colorizer-cmp.nvim',
    'zbirenbaum/copilot.lua',
    'zbirenbaum/copilot-cmp',
    'kristijanhusak/vim-dadbod-completion',
  },
  opts = function()
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    local tailwindcss_colorizer = require('tailwindcss-colorizer-cmp')

    return {
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = 'copilot' },
        { name = 'buffer' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'calc' },
        { name = 'emoji' },
        { name = 'vim-dadbod-completion' },
      }),
      formatting = {
        format = function(entry, vim_item)
          lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '...',
            symbol_map = { Copilot = '' },
          })(entry, vim_item)

          return tailwindcss_colorizer.formatter(entry, vim_item)
        end,
      },
    }
  end,
  event = 'InsertEnter',
}
