local ok, cmp = pcall(require, 'cmp')

if not ok then
  print('cmp is not installed')
  return
end

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
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

vim.cmd('autocmd FileType TelescopePrompt lua require("cmp").setup.buffer { enabled = false }')

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { fg = '#6CC644' })
