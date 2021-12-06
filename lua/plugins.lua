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

  -- LSP
  use('neovim/nvim-lspconfig')
  use('jose-elias-alvarez/null-ls.nvim')
  use('tami5/lspsaga.nvim')
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
    },
  })
  use({ 'tzachar/cmp-tabnine', run = './install.sh' })

  -- Syntax
  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
  use('nvim-treesitter/playground')

  -- Snippets
  use('L3MON4D3/LuaSnip')
  use('rafamadriz/friendly-snippets')

  -- Fuzzy Finder
  use('nvim-telescope/telescope.nvim')
  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })

  -- Colors
  use('norcalli/nvim-colorizer.lua')

  -- Colorscheme
  use('bluz71/vim-nightfly-guicolors')
  use('bluz71/vim-moonfly-colors')

  -- Icons
  use('ryanoasis/vim-devicons')
  use('kyazdani42/nvim-web-devicons')

  -- Lua Development
  use('nvim-lua/plenary.nvim')
  use('nvim-lua/popup.nvim')

  -- Tabline
  -- use('romgrk/barbar.nvim')
  use('kdheepak/tabline.nvim')

  -- Statusline
  -- use { 'glepnir/galaxyline.nvim', branch = 'main' }
  use('nvim-lualine/lualine.nvim')

  -- Indent
  -- use('lukas-reineke/indent-blankline.nvim')

  -- File explorer
  use('kyazdani42/nvim-tree.lua')

  -- Terminal
  use('akinsho/toggleterm.nvim')

  -- Git
  use('tpope/vim-fugitive')
  use('lewis6991/gitsigns.nvim')
  use('sindrets/diffview.nvim')

  -- Comment
  use('terrortylor/nvim-comment')
  use('JoosepAlviste/nvim-ts-context-commentstring')
  use('folke/todo-comments.nvim')

  -- Scrollbar
  use('karb94/neoscroll.nvim')

  -- Editing supports
  use('windwp/nvim-ts-autotag')
  use('p00f/nvim-ts-rainbow')
  use('windwp/nvim-autopairs')
  use('tpope/vim-surround')
  use('editorconfig/editorconfig-vim')
  use({ 'mg979/vim-visual-multi', branch = 'master' })

  -- Others
  use('szw/vim-maximizer')
  use('moll/vim-bbye')
end)
