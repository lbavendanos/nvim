call plug#begin('~/.vim/plugged')
  " Lua
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'

  " Themes
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'cocopon/iceberg.vim'
  " Plug 'noahfrederick/vim-noctu'

  " Icons
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'

  " Statusline and Tabline
  Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
  Plug 'romgrk/barbar.nvim'

  " Finder
  Plug 'nvim-telescope/telescope.nvim'

  " Explorer
  Plug 'kyazdani42/nvim-tree.lua'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'lewis6991/gitsigns.nvim'

  " LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'hrsh7th/nvim-compe'
  Plug 'onsails/lspkind-nvim'
  Plug 'hrsh7th/vim-vsnip'

  " Intellisense
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Syntax Highlighting
  " Plug 'sheerun/vim-polyglot'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " General
  Plug 'Yggdroot/indentLine'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'tomtom/tcomment_vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'honza/vim-snippets'
  Plug 'szw/vim-maximizer'
  Plug 'tpope/vim-surround'
  Plug 'psliwka/vim-smoothie'
  Plug 'norcalli/nvim-colorizer.lua'
call plug#end()
