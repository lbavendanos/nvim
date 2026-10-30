-- NvChad's "atom_colored" icon block: the kind's fg over a bg tinted with that same fg.
-- Groups are created on first use and recreated after a colorscheme change (`:hi clear` empties them).
local function kind_icon_hl(kind_hl)
  local group = kind_hl .. "Icon"
  if vim.tbl_isempty(vim.api.nvim_get_hl(0, { name = group, create = false })) then
    local fg = Snacks.util.color(kind_hl) or Snacks.util.color("BlinkCmpMenu")
    local base = Snacks.util.color("BlinkCmpKindIconBg", "bg")
    vim.api.nvim_set_hl(0, group, { fg = fg, bg = fg and base and Snacks.util.blend(fg, base, 0.3) or base })
  end
  return group
end

-- blink renders the cmdline menu while in command-line mode
local function in_cmdline()
  return vim.api.nvim_get_mode().mode == "c"
end

return {
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      completion = {
        menu = {
          -- NvChad's "atom" layout: icon block flush left, label, dimmed kind on the right
          draw = {
            padding = { 0, 1 },
            columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" } },
            components = {
              kind_icon = {
                -- cmdline: no trailing space, the column gap already separates it from the label
                text = function(ctx)
                  return " " .. vim.trim(ctx.kind_icon) .. (in_cmdline() and "" or " ")
                end,
                -- above the cursorline (10000) so the block keeps its bg on the selected item;
                -- cmdline: plain menu fg, without the colored block
                highlight = function(ctx)
                  if in_cmdline() then
                    return "BlinkCmpMenu"
                  end
                  return { { group = kind_icon_hl(ctx.kind_hl), priority = 20000 } }
                end,
              },
              kind = {
                highlight = "BlinkCmpLabelDescription",
              },
            },
          },
        },
      },
      -- cmdline: LazyVim's default columns, without the atom kind column
      cmdline = {
        completion = {
          menu = {
            draw = {
              columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
            },
          },
        },
      },
    },
  },
}
