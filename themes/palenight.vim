if (has('termguicolors'))
  set termguicolors
endif

let g:palenight_terminal_italics=1
let g:palenight_color_overrides = {
\    'black': { 'gui': '#000000', "cterm": "0", "cterm16": "0" },
\}

colorscheme palenight
