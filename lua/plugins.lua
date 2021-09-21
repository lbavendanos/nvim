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

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'rinx/lspsaga.nvim'
  use 'onsails/lspkind-nvim'
  use 'akinsho/flutter-tools.nvim'

  -- Completion
  use 'hrsh7th/nvim-compe'
  use { 'tzachar/compe-tabnine', run = './install.sh' }

  -- Syntax
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'

  -- Snippets
  use 'hrsh7th/vim-vsnip'
  use 'honza/vim-snippets'

  -- Fuzzy Finder
  use 'nvim-telescope/telescope.nvim'

  -- Colors
  use 'norcalli/nvim-colorizer.lua'

  -- Colorscheme
  use 'bluz71/vim-nightfly-guicolors'
  use 'bluz71/vim-moonfly-colors'

  -- Icons
  use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-web-devicons'

  -- Lua Development
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'

  -- Tabline
  use 'romgrk/barbar.nvim'

  -- Statusline
  use { 'glepnir/galaxyline.nvim', branch = 'main' }

  -- Indent
  use { 'lukas-reineke/indent-blankline.nvim' }

  -- File explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Git
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'

  -- Comment
  use 'terrortylor/nvim-comment'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Scrollbar
  use 'psliwka/vim-smoothie'

  -- Editing supports
  use 'windwp/nvim-ts-autotag'
  use 'p00f/nvim-ts-rainbow'
  use 'windwp/nvim-autopairs'
  use 'tpope/vim-surround'
  use 'editorconfig/editorconfig-vim'
  use { 'mg979/vim-visual-multi', branch = 'master' }

  -- Others
  use 'szw/vim-maximizer'
end)
