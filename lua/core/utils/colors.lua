local M = {}

---Convert color number to hex string
---@param n number
---@return string
function M.hex(n)
  local fmt = string.format

  if n then
    return fmt('#%06x', n)
  end

  return ''
end

---Parse `style` string into nvim_set_hl options
---@param style string
---@return table
function M.parse_style(style)
  if not style or style == 'NONE' then
    return {}
  end

  local result = {}
  for token in string.gmatch(style, '([^,]+)') do
    result[token] = true
  end

  return result
end

---Get highlight opts for a given highlight group name
---@param name string
---@return table
function M.get_highlight(name)
  local hl = vim.api.nvim_get_hl_by_name(name, true)
  if hl.link then
    return M.get_highlight(hl.link)
  end

  local result = M.parse_style(hl.style)
  result.fg = hl.foreground and M.hex(hl.foreground)
  result.bg = hl.background and M.hex(hl.background)
  result.sp = hl.special and M.hex(hl.special)

  return result
end

---Set highlight group from provided table
---@param groups table
function M.set_highlights(groups)
  for group, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

function M.generate_pallet_from_colorscheme()
  -- stylua: ignore
  local color_map = {
    black   = { index = 0, default = "#393b44" },
    red     = { index = 1, default = "#c94f6d" },
    green   = { index = 2, default = "#81b29a" },
    yellow  = { index = 3, default = "#dbc074" },
    blue    = { index = 4, default = "#719cd6" },
    magenta = { index = 5, default = "#9d79d6" },
    cyan    = { index = 6, default = "#63cdcf" },
    white   = { index = 7, default = "#dfdfe0" },
  }

  local diagnostic_map = {
    hint = { hl = 'DiagnosticHint', default = color_map.green.default },
    info = { hl = 'DiagnosticInfo', default = color_map.blue.default },
    warn = { hl = 'DiagnosticWarn', default = color_map.yellow.default },
    error = { hl = 'DiagnosticError', default = color_map.red.default },
  }

  local pallet = {}
  for name, value in pairs(color_map) do
    local global_name = 'terminal_color_' .. value.index
    pallet[name] = vim.g[global_name] and vim.g[global_name] or value.default
  end

  for name, value in pairs(diagnostic_map) do
    pallet[name] = M.get_highlight(value.hl).fg or value.default
  end

  pallet.sl = M.get_highlight('StatusLine')
  pallet.tab = M.get_highlight('TabLine')
  pallet.sel = M.get_highlight('TabLineSel')
  pallet.fill = M.get_highlight('TabLineFill')

  return pallet
end

return M
