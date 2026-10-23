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
      overrides = function(colors)
        local palette = colors.palette
        local theme = colors.theme

        return {
          Normal = { bg = "none" },

          -- gitsigns: use the dragon palette instead of the generic autumn vcs colors
          GitSignsAdd = { fg = palette.dragonGreen2, bg = theme.ui.bg_gutter },
          GitSignsChange = { fg = palette.dragonYellow, bg = theme.ui.bg_gutter },
          GitSignsDelete = { fg = palette.dragonRed, bg = theme.ui.bg_gutter },
          GitSignsAddInline = { bg = theme.diff.add, bold = true },
          GitSignsChangeInline = { bg = theme.diff.text, bold = true },
          GitSignsDeleteInline = { fg = palette.dragonRed, bg = theme.diff.delete, bold = true },
          GitSignsCurrentLineBlame = { fg = theme.syn.comment, italic = true },

          -- statusline fill follows lualine section C (avoids black gaps)
          StatusLine = { link = "lualine_c_normal" },
          StatusLineNC = { link = "lualine_c_inactive" },

          -- lualine path block: bright filename, softer directory (readable on the lighter block)
          LualineFilename = { fg = palette.fujiWhite, bold = true },
          LualineDirectory = { fg = palette.dragonWhite },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-dragon",
      icons = {
        git = {
          added = "+",
          modified = "~",
          removed = "-",
        },
      },
    },
  },
}
