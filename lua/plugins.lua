local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
            install_path)
  execute 'packadd packer.nvim'
end

vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Lua
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'

  -- Themes
  use 'bluz71/vim-nightfly-guicolors'
  use 'bluz71/vim-moonfly-colors'

  -- Icons
  use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-web-devicons'

  -- Statusline and Tabline
  use { 'glepnir/galaxyline.nvim', branch = 'main' }
  use 'romgrk/barbar.nvim'

  -- Finder
  use 'nvim-telescope/telescope.nvim'

  -- Explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Git
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'hrsh7th/nvim-compe'
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/vim-vsnip'

  -- Syntax Highlighting
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'

  -- General
  use 'Yggdroot/indentLine'
  use 'editorconfig/editorconfig-vim'
  use { 'mg979/vim-visual-multi', branch = 'master' }
  use 'tomtom/tcomment_vim'
  use 'jiangmiao/auto-pairs'
  use 'honza/vim-snippets'
  use 'szw/vim-maximizer'
  use 'tpope/vim-surround'
  use 'psliwka/vim-smoothie'
  use 'norcalli/nvim-colorizer.lua'
end)
