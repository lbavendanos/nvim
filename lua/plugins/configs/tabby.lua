local ok, tabby = pcall(require, 'tabby')

if not ok then
  print('tabby is not installed')
  return
end

local utils = require('core.utils.colors')
local set_highlights = utils.set_highlights
local generate_pallet_from_colorscheme = utils.generate_pallet_from_colorscheme

---Generate user highlight groups based on the curent applied colorscheme
---
---NOTE: This is a global because I dont known where this file will be in your config
---and it is needed for the autocmd below
local genreate_user_tabline_highlights = function()
  local pal = generate_pallet_from_colorscheme()

  -- stylua: ignore
  local sl_colors = {
    Black   = { fg = pal.black,   bg = pal.white },
    Red     = { fg = pal.red,     bg = pal.sl.bg },
    Green   = { fg = pal.green,   bg = pal.sl.bg },
    Yellow  = { fg = pal.yellow,  bg = pal.sl.bg },
    Blue    = { fg = pal.blue,    bg = pal.sl.bg },
    Magenta = { fg = pal.magenta, bg = pal.sl.bg },
    Cyan    = { fg = pal.cyan,    bg = pal.sl.bg },
    White   = { fg = pal.white,   bg = pal.black },
  }

  local colors = {}
  for name, value in pairs(sl_colors) do
    colors['User' .. name] = { fg = value.fg, bg = value.bg, bold = true }
    colors['UserRv' .. name] = { fg = value.bg, bg = value.fg, bold = true }
  end

  local groups = {
    -- tabline
    UserTLHead = { fg = pal.fill.bg, bg = pal.cyan },
    UserTLHeadSep = { fg = pal.cyan, bg = pal.fill.bg },
    UserTLActive = { fg = pal.sel.fg, bg = pal.sel.bg, bold = true },
    UserTLActiveSep = { fg = pal.sel.bg, bg = pal.fill.bg },
    UserTLBoldLine = { fg = pal.tab.fg, bg = pal.tab.bg, bold = true },
    UserTLLineSep = { fg = pal.tab.bg, bg = pal.fill.bg },
  }

  set_highlights(vim.tbl_extend('force', colors, groups))
end

genreate_user_tabline_highlights()

vim.api.nvim_create_augroup('UserTablineHighlightGroups', { clear = true })
vim.api.nvim_create_autocmd({ 'SessionLoadPost', 'ColorScheme' }, {
  callback = function()
    genreate_user_tabline_highlights()
  end,
})

----------------------------------------------------------------------------------------------------
-- Tabby

local filename = require('tabby.module.filename')

local cwd = function()
  return '  ' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t') .. ' '
end

local tabline = {
  hl = 'TabLineFill',
  layout = 'active_wins_at_tail',
  head = {
    { cwd, hl = 'UserTLHead' },
    { '', hl = 'UserTLHeadSep' },
  },
  active_tab = {
    label = function(tabid)
      return {
        '  ' .. tabid .. ' ',
        hl = 'UserTLActive',
      }
    end,
    left_sep = { '', hl = 'UserTLActiveSep' },
    right_sep = { '', hl = 'UserTLActiveSep' },
  },
  inactive_tab = {
    label = function(tabid)
      return {
        '  ' .. tabid .. ' ',
        hl = 'UserTLBoldLine',
      }
    end,
    left_sep = { '', hl = 'UserTLLineSep' },
    right_sep = { '', hl = 'UserTLLineSep' },
  },
  top_win = {
    label = function(winid)
      return {
        '  ' .. filename.unique(winid) .. ' ',
        hl = 'TabLine',
      }
    end,
    left_sep = { '', hl = 'UserTLLineSep' },
    right_sep = { '', hl = 'UserTLLineSep' },
  },
  win = {
    label = function(winid)
      return {
        '  ' .. filename.unique(winid) .. ' ',
        hl = 'TabLine',
      }
    end,
    left_sep = { '', hl = 'UserTLLineSep' },
    right_sep = { '', hl = 'UserTLLineSep' },
  },
  tail = {
    { '', hl = 'UserTLHeadSep' },
    { '  ', hl = 'UserTLHead' },
  },
}

tabby.setup({
  tabline = tabline,
})
