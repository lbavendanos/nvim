-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false
vim.g.dbs = {
  { name = "Privoti", url = "mysql://sail:password@127.0.0.1:3306/privoti" },
  { name = "Medusa", url = "postgres://postgres:supersecret@localhost/medusa-demo" },
}

vim.opt.mouse = ""
vim.opt.ignorecase = false
