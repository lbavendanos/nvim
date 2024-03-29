local groups = {
  Normal = { bg = 'NONE' },
  NormalNC = { bg = 'NONE' },
  WinBar = { bg = 'NONE' },
  WinBarNC = { bg = 'NONE' },
  NvimTreeNormal = { bg = 'NONE' },
  TelescopeBorder = { bg = 'NONE' },
  LineNr = { bg = 'NONE' },
  SignColumn = { bg = 'NONE' },
  GitSignsAdd = { bg = 'NONE' },
  GitSignsChange = { bg = 'NONE' },
  GitSignsDelete = { bg = 'NONE' },
}

return {
  {
    'rebelot/kanagawa.nvim',
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        overrides = function()
          return groups
        end,
      })

      vim.cmd('colorscheme kanagawa-dragon')
    end,
  },
  {
    'EdenEast/nightfox.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require('nightfox').setup({
        groups = {
          all = groups,
        },
      })

      vim.cmd('colorscheme duskfox')
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        custom_highlights = groups,
        integrations = {
          lsp_saga = true,
        },
      })

      vim.cmd('colorscheme catppuccin-mocha')
    end,
  },
}
