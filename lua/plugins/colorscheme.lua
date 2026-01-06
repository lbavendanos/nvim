return {
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    opts = {
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function()
        return {
          Normal = { bg = "none" },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-dragon",
    },
  },
}
