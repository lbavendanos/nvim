-- vim-airline style layout:
-- A: mode | B: branch + diff | C: path + symbols | X: status + info/hints + filetype | Y: encoding[format]
-- Z: position + warning/error blocks
-- Colors: kanagawa "ink" theme; color only for alerts, neutral for information
return {
  "nvim-lualine/lualine.nvim",
  optional = true,
  opts = function(_, opts)
    local sections = opts.sections
    local colors = require("kanagawa.colors").setup()
    local palette, theme = colors.palette, colors.theme
    local ui, syn = theme.ui, theme.syn

    -- Find a LazyVim component by name or predicate
    local function find(section, match)
      for i, component in ipairs(sections[section]) do
        if
          component == match
          or type(component) == "table" and (component[1] == match or type(match) == "function" and match(component))
        then
          return component, i
        end
      end
    end

    -- Remove and return a LazyVim component, keeping its original config
    local function take(section, match)
      local _, i = find(section, match)
      return i and table.remove(sections[section], i)
    end

    -- Theme: A/Z mode color, B/Y deep wave blue, C/X ink blue
    local b = { fg = palette.dragonWhite, bg = palette.waveBlue2 }
    local c = { fg = palette.dragonGray, bg = palette.waveBlue1 }

    local function mode(mode_color)
      -- Z is set explicitly: lualine's fallback from A copies the colors but not the gui
      return {
        a = { fg = ui.bg_m3, bg = mode_color, gui = "bold" },
        b = b,
        c = c,
        z = { fg = ui.bg_m3, bg = mode_color },
      }
    end

    opts.options.theme = {
      normal = mode(syn.fun),
      insert = mode(theme.diag.ok),
      visual = mode(syn.keyword),
      replace = mode(syn.constant),
      command = mode(syn.operator),
      inactive = {
        a = { fg = ui.fg_dim, bg = ui.bg_p1, gui = "bold" },
        b = { fg = ui.nontext, bg = ui.bg_p1 },
        c = { fg = ui.nontext, bg = ui.bg_p1 },
      },
    }
    opts.options.section_separators = { left = "", right = "" }
    opts.options.component_separators = { left = "", right = "" }

    -- B: branch + diff, neutral like airline's hunks
    local diff = take("lualine_x", "diff")
    if diff then
      diff.colored = false
      table.insert(sections.lualine_b, diff)
    end

    -- C: path as its own block at the start, a brighter shade of B
    -- (LazyVim's pretty_path is the only function component without a cond)
    if take("lualine_c", function(component)
      return type(component[1]) == "function" and not component.cond
    end) then
      table.insert(sections.lualine_c, 1, {
        LazyVim.lualine.pretty_path({ filename_hl = "LualineFilename", directory_hl = "LualineDirectory" }),
        color = { bg = require("kanagawa.lib.color")(b.bg):brighten(0.12):to_hex() },
        separator = { right = "" },
      })
    end

    -- C: trouble symbols with neutral icons and names
    -- (root_dir also has a cond, but only the trouble component has no color)
    if take("lualine_c", function(component)
      return component.cond and not component.color
    end) then
      local symbols = require("trouble").statusline({
        mode = "symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon:lualine_c_normal}{symbol.name:lualine_c_normal}",
        hl_group = "lualine_c_normal",
      })
      table.insert(sections.lualine_c, {
        symbols.get,
        cond = function()
          return vim.b.trouble_lualine ~= false and symbols.has()
        end,
      })
    end

    -- X: Copilot neutral when ok, LazyVim's colors for pending/error
    -- (LazyVim.lualine.status() keeps the icon as the only upvalue)
    local copilot = find("lualine_x", function(component)
      return type(component[1]) == "function"
        and select(2, debug.getupvalue(component[1], 1)) == LazyVim.config.icons.kinds.Copilot
    end)
    if copilot then
      local status_color = copilot.color
      copilot.color = function()
        local hl = status_color()
        if hl and hl.fg ~= Snacks.util.color("Special") then
          return hl
        end
      end
    end

    -- X: info/hints and filetype (icon on the right), neutral
    local diagnostics = take("lualine_c", "diagnostics")
    if diagnostics then
      diagnostics.sections = { "info", "hint" }
      diagnostics.colored = false
      table.insert(sections.lualine_x, diagnostics)
    end
    take("lualine_c", "filetype")
    table.insert(sections.lualine_x, { "filetype", colored = false, icon = { align = "right" } })

    -- Y: encoding[fileformat]
    sections.lualine_y = {
      function()
        local enc = vim.bo.fileencoding ~= "" and vim.bo.fileencoding or vim.o.encoding
        return enc .. "[" .. vim.bo.fileformat .. "]"
      end,
    }

    -- Z: percentage ☰ line/total ln : col, then warning/error blocks (hidden when there are none)
    local function block(severity, bg)
      return {
        "diagnostics",
        sections = { severity },
        symbols = diagnostics and diagnostics.symbols,
        colored = false,
        color = { fg = ui.bg_m3, bg = bg, gui = "bold" },
        separator = { left = "" },
      }
    end

    sections.lualine_z = {
      { "progress", separator = " ", padding = { left = 1, right = 0 } },
      function()
        return string.format("☰ %d/%d ln : %d", vim.fn.line("."), vim.fn.line("$"), vim.fn.virtcol("."))
      end,
      block("warn", theme.diag.warning),
      block("error", palette.peachRed),
    }
  end,
}
