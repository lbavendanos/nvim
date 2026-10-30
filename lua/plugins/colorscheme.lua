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

        -- completion kinds: vivid palette colors (dragon's syntax colors are too muted for the colored icon blocks),
        -- grouped by family like NvChad: callables blue, members red, variables violet, literals orange...
        local kinds = {
          Array = palette.springViolet2,
          Boolean = palette.surimiOrange,
          Class = palette.waveAqua2,
          Codeium = palette.waveAqua2,
          Color = palette.fujiWhite,
          Constant = palette.surimiOrange,
          Constructor = palette.crystalBlue,
          Copilot = palette.springGreen,
          Enum = palette.crystalBlue,
          EnumMember = palette.oniViolet,
          Event = palette.carpYellow,
          Field = palette.waveRed,
          File = palette.fujiWhite,
          Folder = palette.carpYellow,
          Function = palette.crystalBlue,
          Interface = palette.springGreen,
          Key = palette.waveRed,
          Keyword = palette.springViolet2,
          Method = palette.crystalBlue,
          Module = palette.carpYellow,
          Namespace = palette.carpYellow,
          Null = palette.peachRed,
          Number = palette.surimiOrange,
          Object = palette.springViolet2,
          Operator = palette.oldWhite,
          Package = palette.carpYellow,
          Property = palette.waveRed,
          Reference = palette.oldWhite,
          Snippet = palette.sakuraPink,
          String = palette.springGreen,
          Struct = palette.oniViolet,
          Supermaven = palette.carpYellow,
          TabNine = palette.sakuraPink,
          Text = palette.springGreen,
          TypeParameter = palette.waveRed,
          Unit = palette.oniViolet,
          Value = palette.springBlue,
          Variable = palette.oniViolet,
        }
        local kind_hls = {}
        for kind, color in pairs(kinds) do
          kind_hls["BlinkCmpKind" .. kind] = { fg = color }
        end

        return vim.tbl_extend("error", kind_hls, {
          Normal = { bg = "none" },

          -- floats (lsp hover, diagnostics, docs...) follow the transparent background, only the border shows
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },
          FloatFooter = { bg = "none" },

          -- blink completion menu: same pattern as the floats (transparent, rounded border), selection keeps its bg
          BlinkCmpMenu = { fg = theme.ui.pmenu.fg, bg = "none" },
          -- accent border: tells the completion menu apart from the other (neutral) floats
          BlinkCmpMenuBorder = { fg = palette.dragonBlue, bg = "none" },
          -- the scrollbar sits on the border column: border-colored so it doesn't look like the selection overflowing
          BlinkCmpScrollBarThumb = { bg = palette.dragonBlue },
          BlinkCmpScrollBarGutter = { bg = "none" },
          -- right-hand details (module path, source) dimmed like a comment, without the pmenu bg
          BlinkCmpLabelDescription = { fg = theme.syn.comment, bg = "none" },
          BlinkCmpSource = { fg = theme.syn.comment, bg = "none" },
          -- base each kind's icon block bg is tinted from (lua/plugins/blink.lua)
          BlinkCmpKindIconBg = { bg = theme.ui.bg_p1 },

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
        })
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
        -- NvChad's lspkind icons (nvchad/ui lua/nvchad/icons/lspkind.lua); Array uses a glyph instead of NvChad's "[]", kinds it lacks keep LazyVim's
        kinds = {
          Array = "󰅪 ",
          Boolean = " ",
          Class = "󰠱 ",
          Codeium = " ",
          Color = "󱓻 ",
          Constant = "󰏿 ",
          Constructor = " ",
          Copilot = " ",
          Enum = " ",
          EnumMember = " ",
          Event = " ",
          Field = "󰜢 ",
          File = "󰈚 ",
          Folder = "󰉋 ",
          Function = "󰆧 ",
          Interface = " ",
          Keyword = "󰌋 ",
          Method = "󰆧 ",
          Module = " ",
          Namespace = "󰌗 ",
          Null = "󰟢 ",
          Number = " ",
          Object = "󰅩 ",
          Operator = "󰆕 ",
          Package = " ",
          Property = "󰜢 ",
          Reference = "󰈇 ",
          Snippet = " ",
          String = "󰉿 ",
          Struct = "󰙅 ",
          Supermaven = " ",
          TabNine = " ",
          Text = "󰉿 ",
          TypeParameter = "󰊄 ",
          Unit = "󰑭 ",
          Value = "󰎠 ",
          Variable = "󰀫 ",
        },
      },
    },
  },
}
