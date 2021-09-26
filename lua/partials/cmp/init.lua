local cmp = require('cmp')
local lspkind = require('lspkind')

local source_mapping = {
  buffer = '[Buffer]',
  nvim_lsp = '[LSP]',
  nvim_lua = '[Lua]',
  cmp_tabnine = '[TabNine]',
  -- luasnip = '[LuaSnip]',
  -- latex_symbols = '[Latex]',
  path = '[Path]',
  calc = '[Calc]',
  look = '[Look]',
  emoji = '[Emoji]'
}

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      vim.fn['vsnip#anonymous'](args.body)

      -- For `luasnip` user.
      -- require('luasnip').lsp_expand(args.body)

      -- For `ultisnips` user.
      -- vim.fn["UltiSnips#Anon"](args.body)
    end

  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      -- behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })
  },
  sources = {
    { name = 'buffer' }, { name = 'nvim_lsp' }, { name = 'nvim_lua' },
    { name = 'cmp_tabnine' }, -- { name = 'vsnip' }, -- For vsnip user.
    -- { name = 'luasnip' }, -- For luasnip use.
    -- { name = 'ultisnips' }, -- For ultisnips user.
    { name = 'path' }, { name = 'calc' }, { name = 'look' }, { name = 'emoji' }
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind] .. ' ' ..
                        vim_item.kind

      local menu = source_mapping[entry.source.name]
      if entry.source.name == 'cmp_tabnine' then
        if entry.completion_item.data ~= nil and
          entry.completion_item.data.detail ~= nil then
          menu = entry.completion_item.data.detail .. ' ' .. menu
        end
        vim_item.kind = '' .. ' ' .. vim_item.kind
      end
      vim_item.menu = menu
      return vim_item
    end
  }
})

require('nvim-autopairs.completion.cmp').setup(
  {
    map_cr = true, --  map <CR> on insert mode
    map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
    auto_select = true, -- automatically select the first item
    insert = false, -- use insert confirm behavior instead of replace
    map_char = { -- modifies the function or method delimiter by filetypes
      all = '(',
      tex = '{'
    }
  })
