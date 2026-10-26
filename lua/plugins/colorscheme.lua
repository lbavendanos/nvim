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

          -- floats (lsp hover, diagnostics, docs...) follow the transparent background, only the border shows
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },
          FloatFooter = { bg = "none" },

          -- blink completion menu: same pattern as the floats (transparent, rounded border), selection keeps its bg
          BlinkCmpMenu = { fg = theme.ui.pmenu.fg, bg = "none" },
          BlinkCmpMenuBorder = { link = "FloatBorder" },
          -- the scrollbar sits on the border column: border-colored so it doesn't look like the selection overflowing
          BlinkCmpScrollBarThumb = { bg = theme.ui.float.fg_border },
          BlinkCmpScrollBarGutter = { bg = "none" },
          -- right-hand details (module path, source) dimmed like a comment, without the pmenu bg
          BlinkCmpLabelDescription = { fg = theme.syn.comment, bg = "none" },
          BlinkCmpSource = { fg = theme.syn.comment, bg = "none" },

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
