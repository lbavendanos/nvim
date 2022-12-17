local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute('packadd packer.nvim')
end

vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  use('lewis6991/impatient.nvim')

  -- LSP Installer
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use('jay-babu/mason-null-ls.nvim')

  -- LSP
  use('neovim/nvim-lspconfig')
  use('jose-elias-alvarez/null-ls.nvim')
  use({ 'glepnir/lspsaga.nvim', branch = 'main' })
  use('ray-x/lsp_signature.nvim')
  use('onsails/lspkind-nvim')
  use('folke/lsp-colors.nvim')
  use('folke/trouble.nvim')
  use('akinsho/flutter-tools.nvim')

  -- Completion
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-cmdline',
    },
  })

  -- Syntax
  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
  use('nvim-treesitter/playground')

  -- Snippets
  use('L3MON4D3/LuaSnip')
  use('rafamadriz/friendly-snippets')
  use('burkeholland/simple-react-snippets')

  -- Fuzzy Finder
  use('nvim-telescope/telescope.nvim')
  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
  use({ 'nvim-telescope/telescope-file-browser.nvim' })
  use({ 'nvim-telescope/telescope-ui-select.nvim' })
  use({ 'nvim-telescope/telescope-live-grep-args.nvim' })

  -- Colors
  use('norcalli/nvim-colorizer.lua')

  -- Colorscheme
  use({ 'catppuccin/nvim', as = 'catppuccin' })
  use('EdenEast/nightfox.nvim')
  use('rebelot/kanagawa.nvim')

  -- Icons
  use('nvim-tree/nvim-web-devicons')

  -- Lua Development
  use('nvim-lua/plenary.nvim')
  use('nvim-lua/popup.nvim')

  -- Tabline
  use('kdheepak/tabline.nvim')
  use('nanozuki/tabby.nvim')

  -- Statusline
  use('nvim-lualine/lualine.nvim')
  use('feline-nvim/feline.nvim')

  -- File explorer
  use('nvim-tree/nvim-tree.lua')

  -- Git
  use('tpope/vim-fugitive')
  use('lewis6991/gitsigns.nvim')
  use('sindrets/diffview.nvim')

  -- Comment
  use('JoosepAlviste/nvim-ts-context-commentstring')
  use('numToStr/Comment.nvim')
  use('folke/todo-comments.nvim')

  -- Editing supports
  use('windwp/nvim-ts-autotag')
  use('p00f/nvim-ts-rainbow')
  use('windwp/nvim-autopairs')
  use('tpope/vim-surround')
  use('editorconfig/editorconfig-vim')
  use({ 'mg979/vim-visual-multi', branch = 'master' })

  -- Others
  use('szw/vim-maximizer')
  use('famiu/bufdelete.nvim')
  use({
    'kkoomen/vim-doge',
    run = ':call doge#install()',
  })
end)
