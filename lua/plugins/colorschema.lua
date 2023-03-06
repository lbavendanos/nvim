return {
  -- { 'catppuccin/nvim', name = 'catppuccin' },
  -- 'EdenEast/nightfox.nvim',
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        overrides = function(colors)
          return {
            Normal = { bg = 'NONE' },
            NvimTreeNormal = { bg = 'NONE' },
            TelescopeBorder = { bg = 'NONE' },
            LineNr = { bg = 'NONE' },
            SignColumn = { bg = 'NONE' },
            GitSignsAdd = { bg = 'NONE' },
            GitSignsChange = { bg = 'NONE' },
            GitSignsDelete = { bg = 'NONE' },
            tabline_a_normal = { bg = colors.palette.waveAqua2, fg = colors.palette.sumiInk0 },
            tabline_b_normal = { bg = colors.palette.sumiInk0, fg = colors.palette.waveAqua2 },
            tabline_c_normal = { bg = colors.palette.sumiInk0, fg = colors.palette.waveAqua2 },
          }
        end,
      })

      vim.cmd('colorscheme kanagawa')
    end,
  },
}
