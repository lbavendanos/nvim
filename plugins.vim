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
  " Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }
  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  " Commetary
  Plug 'tomtom/tcomment_vim'
  " Intellisense
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Lint
  " Plug 'dense-analysis/ale'
  " Format
  " Plug 'prettier/vim-prettier', { 'do': 'npm install' }
  " Editorconfig
  Plug 'editorconfig/editorconfig-vim'
  " Syntax Highlighting
  " Plug 'sheerun/vim-polyglot'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  " Plug 'StanAngeloff/php.vim'
  " Plug 'pangloss/vim-javascript'
  " Plug 'leafgarland/typescript-vim'
  " Plug 'posva/vim-vue'
  " Complements
  Plug 'jiangmiao/auto-pairs'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()
