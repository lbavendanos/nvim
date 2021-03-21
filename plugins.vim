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
  Plug 'romgrk/barbar.nvim'
  Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
  " Plug 'itchyny/lightline.vim'
  " Plug 'mengelbrecht/lightline-bufferline'

  " Finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'nvim-telescope/telescope.nvim'

  " Explorer
  Plug 'kyazdani42/nvim-tree.lua'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " Intellisense
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
