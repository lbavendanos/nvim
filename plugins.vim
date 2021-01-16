call plug#begin('~/.vim/plugged')
  " Theme
  " Plug 'kaicataldo/material.vim', { 'branch': 'main' }
  " Plug 'morhetz/gruvbox'
  " Plug 'joshdick/onedark.vim'
  " Plug 'drewtempelmeyer/palenight.vim'
  Plug 'bluz71/vim-nightfly-guicolors'
  " Plug 'bluz71/vim-moonfly-colors'
  " Icons
  Plug 'ryanoasis/vim-devicons'
  " Status Bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " FZF
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  " Intellisense
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Lint
  " Plug 'dense-analysis/ale'
  " Format
  " Plug 'prettier/vim-prettier', { 'do': 'npm install' }
  " Editorconfig
  Plug 'editorconfig/editorconfig-vim'
  " Syntax Highlighting
  " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  " Plug 'sheerun/vim-polyglot'
  Plug 'StanAngeloff/php.vim'
  Plug 'jwalton512/vim-blade'
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'posva/vim-vue'
  " Complements
  Plug 'Yggdroot/indentLine'
  Plug 'moll/vim-bbye'
  Plug 'voldikss/vim-floaterm'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'tomtom/tcomment_vim'
  Plug 'jiangmiao/auto-pairs'
call plug#end()
