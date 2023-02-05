return {
  -- { 'catppuccin/nvim', name = 'catppuccin' },
  -- 'EdenEast/nightfox.nvim',
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local dc = require('kanagawa.colors').setup()

      require('kanagawa').setup({
        overrides = {
          Normal = { bg = 'NONE' },
          NvimTreeNormal = { bg = 'NONE' },
          TelescopeBorder = { bg = 'NONE' },
          tabline_a_normal = { bg = dc.waveAqua2, fg = dc.sumiInk0 },
          tabline_b_normal = { bg = dc.sumiInk0, fg = dc.waveAqua2 },
          tabline_c_normal = { bg = dc.sumiInk0, fg = dc.waveAqua2 },
        },
      })

      vim.cmd('colorscheme kanagawa')
    end,
  },
}
