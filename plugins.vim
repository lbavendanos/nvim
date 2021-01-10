call plug#begin('~/.vim/plugged')
  " Theme
  Plug 'kaicataldo/material.vim', { 'branch': 'main' }
  " Plug 'morhetz/gruvbox'
  " Plug 'joshdick/onedark.vim'
  " Plug 'drewtempelmeyer/palenight.vim'
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
  " Plug 'preservim/nerdcommenter'
  Plug 'tomtom/tcomment_vim'
  " Plug 'tpope/vim-commentary'
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
  Plug 'StanAngeloff/php.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'posva/vim-vue'
  " Complements
  Plug 'jiangmiao/auto-pairs'
call plug#end()
