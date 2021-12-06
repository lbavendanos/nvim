require('neoscroll').setup()

local time = 80

local t = {}
t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', time } }
t['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', time } }
t['<C-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', time } }
t['<C-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', time } }
t['<C-y>'] = { 'scroll', { '-0.10', 'false', time } }
t['<C-e>'] = { 'scroll', { '0.10', 'false', time } }
t['zt'] = { 'zt', { time } }
t['zz'] = { 'zz', { time } }
t['zb'] = { 'zb', { time } }

require('neoscroll.config').set_mappings(t)
