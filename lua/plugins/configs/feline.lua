local ok, feline = pcall(require, 'feline')

if not ok then
  print('feline is not installed')
  return
end

local utils = require('core.utils.colors')
local set_highlights = utils.set_highlights
local generate_pallet_from_colorscheme = utils.generate_pallet_from_colorscheme
local fmt = string.format

---Generate user highlight groups based on the curent applied colorscheme
---
---NOTE: This is a global because I dont known where this file will be in your config
---and it is needed for the autocmd below
local generate_user_statusline_highlights = function()
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

  local status = vim.o.background == 'dark' and { fg = pal.black, bg = pal.white } or { fg = pal.white, bg = pal.black }

  local groups = {
    -- statusline
    UserSLHint = { fg = pal.sl.bg, bg = pal.hint, bold = true },
    UserSLInfo = { fg = pal.sl.bg, bg = pal.info, bold = true },
    UserSLWarn = { fg = pal.sl.bg, bg = pal.warn, bold = true },
    UserSLError = { fg = pal.sl.bg, bg = pal.error, bold = true },
    UserSLStatus = { fg = status.fg, bg = status.bg, bold = true },

    UserSLFtHint = { fg = pal.sel.bg, bg = pal.hint },
    UserSLHintInfo = { fg = pal.hint, bg = pal.info },
    UserSLInfoWarn = { fg = pal.info, bg = pal.warn },
    UserSLWarnError = { fg = pal.warn, bg = pal.error },
    UserSLErrorStatus = { fg = pal.error, bg = status.bg },
    UserSLStatusBg = { fg = status.bg, bg = pal.sl.bg },

    UserSLAlt = pal.sel,
    UserSLAltSep = { fg = pal.sl.bg, bg = pal.sel.bg },
    UserSLGitBranch = { fg = pal.yellow, bg = pal.sl.bg },
  }

  set_highlights(vim.tbl_extend('force', colors, groups))
end

generate_user_statusline_highlights()

vim.api.nvim_create_augroup('UserStatuslineHighlightGroups', { clear = true })
vim.api.nvim_create_autocmd({ 'SessionLoadPost', 'ColorScheme' }, {
  callback = function()
    generate_user_statusline_highlights()
  end,
})

----------------------------------------------------------------------------------------------------
-- Feline

local vi = {
  -- Map vi mode to text name
  text = {
    n = 'NORMAL',
    no = 'NORMAL',
    i = 'INSERT',
    v = 'VISUAL',
    V = 'V-LINE',
    [''] = 'V-BLOCK',
    c = 'COMMAND',
    cv = 'COMMAND',
    ce = 'COMMAND',
    R = 'REPLACE',
    Rv = 'REPLACE',
    s = 'SELECT',
    S = 'SELECT',
    [''] = 'SELECT',
    t = 'TERMINAL',
  },

  -- Maps vi mode to highlight group color defined above
  colors = {
    n = 'UserRvCyan',
    no = 'UserRvCyan',
    i = 'UserSLStatus',
    v = 'UserRvMagenta',
    V = 'UserRvMagenta',
    [''] = 'UserRvMagenta',
    R = 'UserRvRed',
    Rv = 'UserRvRed',
    r = 'UserRvBlue',
    rm = 'UserRvBlue',
    s = 'UserRvMagenta',
    S = 'UserRvMagenta',
    [''] = 'FelnMagenta',
    c = 'UserRvYellow',
    ['!'] = 'UserRvBlue',
    t = 'UserRvBlue',
  },

  -- Maps vi mode to seperator highlight goup defined above
  sep = {
    n = 'UserCyan',
    no = 'UserCyan',
    i = 'UserSLStatusBg',
    v = 'UserMagenta',
    V = 'UserMagenta',
    [''] = 'UserMagenta',
    R = 'UserRed',
    Rv = 'UserRed',
    r = 'UserBlue',
    rm = 'UserBlue',
    s = 'UserMagenta',
    S = 'UserMagenta',
    [''] = 'FelnMagenta',
    c = 'UserYellow',
    ['!'] = 'UserBlue',
    t = 'UserBlue',
  },
}

local icons = {
  locker = '', -- #f023
  page = '☰', -- 2630
  line_number = '', -- e0a1
  connected = '', -- f817
  dos = '', -- e70f
  unix = '', -- f17c
  mac = '', -- f179
  mathematical_L = '𝑳',
  vertical_bar = '┃',
  vertical_bar_thin = '│',
  left = '',
  right = '',
  block = '█',
  left_filled = '',
  right_filled = '',
  slant_left = '',
  slant_left_thin = '',
  slant_right = '',
  slant_right_thin = '',
  slant_left_2 = '',
  slant_left_2_thin = '',
  slant_right_2 = '',
  slant_right_2_thin = '',
  left_rounded = '',
  left_rounded_thin = '',
  right_rounded = '',
  right_rounded_thin = '',
  circle = '●',
}

---Get the number of diagnostic messages for the provided severity
---@param str string [ERROR | WARN | INFO | HINT]
---@return string
local function get_diag(str)
  local diagnostics = vim.diagnostic.get(0, { severity = vim.diagnostic.severity[str] })
  local count = #diagnostics

  return (count > 0) and ' ' .. count .. ' ' or ''
end

---Get highlight group from vi mode
---@return string
local function vi_mode_hl()
  return vi.colors[vim.fn.mode()] or 'UserSLViBlack'
end

---Get sep highlight group from vi mode
local function vi_sep_hl()
  return vi.sep[vim.fn.mode()] or 'UserSLBlack'
end

---Get the path of the file relative to the cwd
---@return string
local function file_info()
  local list = {}
  if vim.bo.readonly then
    table.insert(list, '🔒')
  end

  if vim.bo.modified then
    table.insert(list, '●')
  end

  table.insert(list, vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':~:.'))

  return table.concat(list, ' ')
end

-- Create a table that contians every status line commonent
local c = {
  vimode = {
    provider = function()
      return fmt(' %s ', vi.text[vim.fn.mode()])
    end,
    hl = vi_mode_hl,
    right_sep = { str = ' ', hl = vi_sep_hl },
  },
  gitbranch = {
    provider = 'git_branch',
    icon = ' ',
    hl = 'UserSLGitBranch',
    right_sep = { str = '  ', hl = 'UserSLGitBranch' },
    enabled = function()
      return vim.b.gitsigns_status_dict ~= nil
    end,
  },
  file_type = {
    provider = function()
      return fmt(' %s ', vim.bo.filetype:upper())
    end,
    hl = 'UserSLAlt',
  },
  fileinfo = {
    provider = { name = 'file_info', opts = { type = 'base-only' } },
    hl = 'UserSLAlt',
    left_sep = { str = ' ', hl = 'UserSLAltSep' },
    right_sep = { str = ' ', hl = 'UserSLAltSep' },
  },
  file_enc = {
    provider = function()
      local os = icons[vim.bo.fileformat] or ''
      return fmt(' %s %s ', os, vim.bo.fileencoding)
    end,
    hl = 'StatusLine',
    left_sep = { str = icons.left_filled, hl = 'UserSLAltSep' },
  },
  cur_position = {
    provider = function()
      -- TODO: What about 4+ diget line numbers?
      return fmt(' %3d:%-2d ', unpack(vim.api.nvim_win_get_cursor(0)))
    end,
    hl = vi_mode_hl,
    left_sep = { str = icons.left_filled, hl = vi_sep_hl },
  },
  cur_percent = {
    provider = function()
      return ' ' .. require('feline.providers.cursor').line_percentage() .. '  '
    end,
    hl = vi_mode_hl,
    left_sep = { str = icons.left, hl = vi_mode_hl },
  },
  default = { -- needed to pass the parent StatusLine hl group to right hand side
    provider = '',
    hl = 'StatusLine',
  },
  lsp_status = {
    provider = function()
      return vim.tbl_count(vim.lsp.buf_get_clients(0)) == 0 and '' or ' ◦ '
    end,
    hl = 'UserSLStatus',
    left_sep = { str = '', hl = 'UserSLStatusBg', always_visible = true },
    right_sep = { str = '', hl = 'UserSLErrorStatus', always_visible = true },
  },
  lsp_error = {
    provider = function()
      return get_diag('ERROR')
    end,
    hl = 'UserSLError',
    right_sep = { str = '', hl = 'UserSLWarnError', always_visible = true },
  },
  lsp_warn = {
    provider = function()
      return get_diag('WARN')
    end,
    hl = 'UserSLWarn',
    right_sep = { str = '', hl = 'UserSLInfoWarn', always_visible = true },
  },
  lsp_info = {
    provider = function()
      return get_diag('INFO')
    end,
    hl = 'UserSLInfo',
    right_sep = { str = '', hl = 'UserSLHintInfo', always_visible = true },
  },
  lsp_hint = {
    provider = function()
      return get_diag('HINT')
    end,
    hl = 'UserSLHint',
    right_sep = { str = '', hl = 'UserSLFtHint', always_visible = true },
  },

  in_fileinfo = {
    provider = 'file_info',
    hl = 'StatusLine',
  },
  in_position = {
    provider = 'position',
    hl = 'StatusLine',
  },
  file_winbar = {
    provider = file_info,
    hl = 'Comment',
  },
}

local active = {
  { -- left
    c.vimode,
    c.gitbranch,
    c.fileinfo,
    c.default, -- must be last
  },
  { -- right
    c.lsp_status,
    c.lsp_error,
    c.lsp_warn,
    c.lsp_info,
    c.lsp_hint,
    c.file_type,
    c.file_enc,
    c.cur_position,
    c.cur_percent,
  },
}

local inactive = {
  { c.in_fileinfo }, -- left
  { c.in_position }, -- right
}

feline.setup({
  components = { active = active, inactive = inactive },
  highlight_reset_triggers = {},
  force_inactive = {
    filetypes = {
      'NvimTree',
      'packer',
      'dap-repl',
      'dapui_scopes',
      'dapui_stacks',
      'dapui_watches',
      'dapui_repl',
      'LspTrouble',
      'qf',
      'help',
    },
    buftypes = { 'terminal' },
    bufnames = {},
  },
  disable = {
    filetypes = {
      'dashboard',
      'startify',
    },
  },
})
