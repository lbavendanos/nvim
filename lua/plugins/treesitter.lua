return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'windwp/nvim-ts-autotag',
      { 'JoosepAlviste/nvim-ts-context-commentstring', opts = {
        enable_autocmd = false,
      } },
    },
    build = ':TSUpdate',
    event = 'BufReadPost',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = 'all', -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        highlight = {
          enable = true, -- false will disable the whole extension
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        autotag = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<backspace>',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['aP'] = '@parameter.outer',
              ['iP'] = '@parameter.inner',
              ['aF'] = '@function.outer',
              ['iF'] = '@function.inner',
              ['aC'] = '@class.outer',
              ['iC'] = '@class.inner',
            },
          },
        },
      })
    end,
  },
}
