call plug#begin('~/.vim/plugged')
  " Themes
  " Plug 'kaicataldo/material.vim', { 'branch': 'main' }
  " Plug 'joshdick/onedark.vim'
  Plug 'drewtempelmeyer/palenight.vim'
  " Plug 'bluz71/vim-nightfly-guicolors'
  " Plug 'bluz71/vim-moonfly-colors'
  " Plug 'arcticicestudio/nord-vim'
  Plug 'cocopon/iceberg.vim'
  " Plug 'noahfrederick/vim-noctu'

  " Icons
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'

  " Statusline/Tabline
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'

  " Lua
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'

  " Fuzzy Finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }
  Plug 'nvim-telescope/telescope.nvim'

  " File Explorer
  " Plug 'kyazdani42/nvim-tree.lua'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " Intellisense
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Syntax Highlighting
  " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'sheerun/vim-polyglot'

  " Complements
  Plug 'moll/vim-bbye'
  Plug 'Yggdroot/indentLine'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'tomtom/tcomment_vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'honza/vim-snippets'
  Plug 'szw/vim-maximizer'
  Plug 'tpope/vim-surround'
  Plug 'psliwka/vim-smoothie'
call plug#end()
