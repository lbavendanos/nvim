local cmp = require('cmp')
local lspkind = require('lspkind')
local function prequire(...)
  local status, lib = pcall(require, ...)
  if status then
    return lib
  end
  return nil
end

local luasnip = prequire('luasnip')

local source_mapping = {
  buffer = '[Buffer]',
  nvim_lsp = '[LSP]',
  nvim_lua = '[Lua]',
  cmp_tabnine = '[TN]',
  luasnip = '[LuaSnip]',
  latex_symbols = '[Latex]',
  path = '[Path]',
  calc = '[Calc]',
  emoji = '[Emoji]',
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local function tab(fallback)
  if vim.fn.getbufvar(vim.fn.bufnr(), '&filetype') == 'TelescopePrompt' then
    fallback()
  elseif cmp.visible() then
    cmp.select_next_item()
  elseif luasnip and luasnip.expand_or_jumpable() then
    vim.fn.feedkeys(t('<Plug>luasnip-expand-or-jump'), '')
  elseif check_back_space() then
    vim.fn.feedkeys(t('<tab>'), 'n')
  else
    fallback()
  end
end

local function shift_tab(fallback)
  if vim.fn.getbufvar(vim.fn.bufnr(), '&filetype') == 'TelescopePrompt' then
    fallback()
  elseif cmp.visible() then
    cmp.select_prev_item()
  elseif luasnip and luasnip.jumpable(-1) then
    vim.fn.feedkeys(t('<Plug>luasnip-jump-prev'), '')
  else
    fallback()
  end
end

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `luasnip` user.
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      -- behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<Tab>'] = cmp.mapping(tab, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(shift_tab, { 'i', 's' }),
  },
  sources = {
    { name = 'buffer' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'cmp_tabnine' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'calc' },
    { name = 'emoji' },
  },
  formatting = {
    format = function(entry, vim_item)
      -- fancy icons and a name of kind
      vim_item.kind = lspkind.presets.default[vim_item.kind] .. ' ' .. vim_item.kind

      -- set a name for each source
      local menu = source_mapping[entry.source.name]

      -- fancy tabnine icon
      if entry.source.name == 'cmp_tabnine' then
        if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          menu = entry.completion_item.data.detail .. ' ' .. menu
        end
        vim_item.kind = '' .. ' ' .. vim_item.kind
      end

      vim_item.menu = menu
      return vim_item
    end,
  },
})

require('nvim-autopairs.completion.cmp').setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
  auto_select = true, -- automatically select the first item
  insert = false, -- use insert confirm behavior instead of replace
  map_char = { -- modifies the function or method delimiter by filetypes
    all = '(',
    tex = '{',
  },
})
