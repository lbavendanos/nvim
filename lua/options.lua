local options = {
  compatible = false,
  hidden = true, -- Required to keep multiple buffers open multiple buffers
  wrap = false, -- Display long lines as just one line
  incsearch = true,
  encoding = 'utf-8', -- The encoding displayed
  pumheight = 10, -- Makes popup menu smaller
  fileencoding = 'utf-8', -- The encoding written to file
  ruler = true, -- Show the cursor position all the time
  cmdheight = 2, -- More space for displaying messages
  splitbelow = true, -- Horizontal splits will automatically be below
  splitright = true, -- Vertical splits will automatically be to the right
  tabstop = 2, -- Insert 2 spaces for a tab
  shiftwidth = 2, -- Change the number of space characters inserted for indentation
  smarttab = true, -- Makes tabbing smarter will realize you have 2 vs 4
  expandtab = true, -- Converts tabs to spaces
  smartindent = true, -- Makes indenting smart
  autoindent = true, -- Good auto indent
  laststatus = 2, -- Always display the status line
  number = true, -- Line numbers
  relativenumber = true,
  cursorline = true, -- Enable highlighting of the current line
  background = 'dark', -- tell vim what the background color looks like
  showtabline = 2, -- Always show tabs
  showmode = false, -- We don't need to see things like -- INSERT -- anymore
  backup = false, -- This is recommended by coc
  writebackup = false, -- This is recommended by coc
  completeopt = { 'menu', 'menuone', 'noselect' }, -- Compe option
  colorcolumn = '99999', -- Hack to remove Blank lines in indentline
  signcolumn = 'yes', -- Always show the signcolumn, otherwise it would shift the text each time
  updatetime = 300, -- Faster completion
  clipboard = 'unnamedplus', -- Copy paste between vim and everything else
  mouse = '',
  grepprg = 'rg --vimgrep',
  termguicolors = true,
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.cmd('syntax on') -- Enables syntax highlighing
vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
