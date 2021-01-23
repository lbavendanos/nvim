call plug#begin('~/.vim/plugged')
  " Theme
  " Plug 'kaicataldo/material.vim', { 'branch': 'main' }
  " Plug 'morhetz/gruvbox'
  " Plug 'lifepillar/vim-gruvbox8'
  " Plug 'joshdick/onedark.vim'
  " Plug 'rakr/vim-one'
  " Plug 'drewtempelmeyer/palenight.vim'
  Plug 'bluz71/vim-nightfly-guicolors'
  " Plug 'bluz71/vim-moonfly-colors'
  " Plug 'noahfrederick/vim-noctu'

  " Icons
  Plug 'ryanoasis/vim-devicons'
  " Statusline/Tabline
  " Plug 'vim-airline/vim-airline'
  " Plug 'vim-airline/vim-airline-themes'
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'

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

  " Syntax Highlighting
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  " Plug 'sheerun/vim-polyglot'
  Plug 'StanAngeloff/php.vim'
  Plug 'jwalton512/vim-blade'
  " Plug 'pangloss/vim-javascript'
  " Plug 'leafgarland/typescript-vim'
  Plug 'posva/vim-vue'

  " Complements
  Plug 'moll/vim-bbye'
  Plug 'voldikss/vim-floaterm'
  Plug 'Yggdroot/indentLine'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'tomtom/tcomment_vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'honza/vim-snippets'
call plug#end()
