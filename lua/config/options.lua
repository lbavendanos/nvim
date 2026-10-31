-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false
vim.opt.mouse = ""
vim.opt.ignorecase = false

-- The util.dot extra maps .env.* files to sh, so bashls runs shellcheck on them
-- and flags every variable as unused (SC2034). Keep them as env, like .env.
vim.filetype.add({
  pattern = {
    [".*/%.env%.[%w_.-]+"] = { "env", { priority = 1 } },
  },
})
