-- TODO: Remove 'opt' functionality until PR is merged
-- https://github.com/neovim/neovim/pull/13479
local opts_info = vim.api.nvim_get_all_options_info()
local opt = setmetatable({}, {
  __index = vim.o,
  __newindex = function(_, key, value)
    vim.o[key] = value
    local scope = opts_info[key].scope
    if scope == 'win' then
      vim.wo[key] = value
    elseif scope == 'buf' then
      vim.bo[key] = value
    end
  end
})

opt.compatible = false
vim.cmd('syntax on') -- Enables syntax highlighing
opt.hidden = true -- Required to keep multiple buffers open multiple buffers
opt.wrap = false -- Display long lines as just one line
opt.incsearch = true
opt.encoding = 'utf-8' -- The encoding displayed
opt.pumheight = 10 -- Makes popup menu smaller
opt.fileencoding = 'utf-8' -- The encoding written to file
opt.ruler = true -- Show the cursor position all the time
opt.cmdheight = 2 -- More space for displaying messages
opt.splitbelow = true -- Horizontal splits will automatically be below
opt.splitright = true -- Vertical splits will automatically be to the right
vim.o.t_Co = '256' -- Support 256 colors
opt.tabstop = 2 -- Insert 2 spaces for a tab
opt.shiftwidth = 2 -- Change the number of space characters inserted for indentation
opt.smarttab = true -- Makes tabbing smarter will realize you have 2 vs 4
opt.expandtab = true -- Converts tabs to spaces
opt.smartindent = true -- Makes indenting smart
opt.autoindent = true -- Good auto indent
opt.laststatus = 2 -- Always display the status line
opt.number = true -- Line numbers
opt.relativenumber = true
opt.cursorline = true -- Enable highlighting of the current line
opt.background = 'dark' -- tell vim what the background color looks like
opt.showtabline = 2 -- Always show tabs
opt.showmode = false -- We don't need to see things like -- INSERT -- anymore
opt.backup = false -- This is recommended by coc
opt.writebackup = false -- This is recommended by coc
vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
opt.completeopt = 'menuone,noselect' -- Compe option
opt.colorcolumn = '99999' -- Hack to remove Blank lines in indentline
opt.signcolumn = 'yes' -- Always show the signcolumn, otherwise it would shift the text each time
opt.updatetime = 300 -- Faster completion
opt.clipboard = 'unnamedplus' -- Copy paste between vim and everything else
vim.cmd('set grepprg=rg\\ --vimgrep')
