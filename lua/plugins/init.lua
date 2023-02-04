local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'lewis6991/impatient.nvim',

  -- LSP Installer
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'jay-babu/mason-null-ls.nvim',

  -- LSP
  'neovim/nvim-lspconfig',
  'jose-elias-alvarez/null-ls.nvim',
  { 'glepnir/lspsaga.nvim', branch = 'main' },
  'ray-x/lsp_signature.nvim',
  'onsails/lspkind-nvim',
  'folke/lsp-colors.nvim',
  'folke/trouble.nvim',

  -- Completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-cmdline',
    },
  },

  -- Syntax
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

  -- Snippets
  'L3MON4D3/LuaSnip',
  'rafamadriz/friendly-snippets',
  'burkeholland/simple-react-snippets',

  -- Fuzzy Finder
  'nvim-telescope/telescope.nvim',
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  'nvim-telescope/telescope-file-browser.nvim',
  'nvim-telescope/telescope-ui-select.nvim',
  'nvim-telescope/telescope-live-grep-args.nvim',

  -- Colors
  'norcalli/nvim-colorizer.lua',

  -- Colorscheme
  { 'catppuccin/nvim', name = 'catppuccin' },
  'EdenEast/nightfox.nvim',
  'rebelot/kanagawa.nvim',

  -- Icons
  'nvim-tree/nvim-web-devicons',

  -- Lua Development
  'nvim-lua/plenary.nvim',
  'nvim-lua/popup.nvim',

  -- Tabline
  'kdheepak/tabline.nvim',
  'nanozuki/tabby.nvim',

  -- Statusline
  'nvim-lualine/lualine.nvim',
  'feline-nvim/feline.nvim',

  -- File explorer
  'nvim-tree/nvim-tree.lua',

  -- Git
  'tpope/vim-fugitive',
  'lewis6991/gitsigns.nvim',
  'sindrets/diffview.nvim',

  -- Comment
  'JoosepAlviste/nvim-ts-context-commentstring',
  'numToStr/Comment.nvim',
  'folke/todo-comments.nvim',

  -- Editing supports
  'windwp/nvim-ts-autotag',
  'p00f/nvim-ts-rainbow',
  'windwp/nvim-autopairs',
  'tpope/vim-surround',
  'editorconfig/editorconfig-vim',
  { 'mg979/vim-visual-multi', branch = 'master' },

  -- Others
  'szw/vim-maximizer',
  'famiu/bufdelete.nvim',
  { 'yardnsm/vim-import-cost', build = 'npm install --production' },
  {
    'kkoomen/vim-doge',
    build = 'npm i --no-save && npm run build:binary:unix',
  },
})

