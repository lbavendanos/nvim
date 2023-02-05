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
  },
  config = function()
    local cmp = require('cmp')
    local lspkind = require('lspkind')

    local source_mapping = {
      copilot = '[Copilot]',
      buffer = '[Buffer]',
      nvim_lsp = '[LSP]',
      nvim_lua = '[Lua]',
      -- cmp_tabnine = '[TN]',
      luasnip = '[LuaSnip]',
      latex_symbols = '[Latex]',
      path = '[Path]',
      calc = '[Calc]',
      emoji = '[Emoji]',
    }

    cmp.setup({
      snippet = {
        expand = function(args)
          -- For `luasnip` user.
          require('luasnip').lsp_expand(args.body)
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
        ['<C-e>'] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = 'copilot', group_index = 2 },
        { name = 'buffer', group_index = 2 },
        { name = 'nvim_lsp', group_index = 2 },
        { name = 'nvim_lua', group_index = 2 },
        -- { name = 'cmp_tabnine', group_index = 2 },
        { name = 'luasnip', group_index = 2 },
        { name = 'path', group_index = 2 },
        { name = 'calc', group_index = 2 },
        { name = 'emoji', group_index = 2 },
      }),
      formatting = {
        format = function(entry, vim_item)
          -- fancy icons and a name of kind
          -- vim_item.kind = lspkind.presets.default[vim_item.kind] .. ' ' .. vim_item.kind

          -- set a name for each source
          -- local menu = source_mapping[entry.source.name]

          -- fancy tabnine icon
          -- if entry.source.name == 'cmp_tabnine' then
          --   if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          --     menu = entry.completion_item.data.detail .. ' ' .. menu
          --   end
          --   vim_item.kind = '' .. ' ' .. vim_item.kind
          -- end

          -- fancy copilot icon
          if entry.source.name == 'copilot' then
            vim_item.kind = '[] Copilot'
            vim_item.kind_hl_group = 'CmpItemKindCopilot'
            return vim_item
          end

          return lspkind.cmp_format({ maxwidth = 50 })(entry, vim_item)

          -- vim_item.menu = menu
          -- return vim_item
        end,
      },
    })
  end,
  event = 'InsertEnter',
}
