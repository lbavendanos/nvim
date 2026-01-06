return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Recommended for `ask()` and `select()`.
    -- Required for `snacks` provider.
    ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  keys = {
    { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
    {
      "<leader>ao",
      function()
        require("opencode").toggle()
      end,
      mode = { "n", "t" },
      desc = "Toggle opencode",
    },
    {
      "<leader>ax",
      function()
        require("opencode").select()
      end,
      mode = { "n", "x" },
      desc = "Execute opencode action…",
    },
    {
      "<leader>aa",
      function()
        require("opencode").ask("@this: ", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "Ask opencode",
    },
    {
      "<leader>ab",
      function()
        return require("opencode").prompt("@buffer")
      end,
      mode = { "n", "x" },
      desc = "Add buffer to opencode",
    },
    {
      "<leader>as",
      function()
        return require("opencode").prompt("@this")
      end,
      mode = { "n", "x" },
      desc = "Add selection to opencode",
    },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
    }

    -- Required for `opts.events.reload`.
    vim.o.autoread = true

    -- vim.keymap.set({ "n", "x" }, "go", function()
    --   return require("opencode").operator("@this ")
    -- end, { expr = true, desc = "Add range to opencode" })
    -- vim.keymap.set("n", "goo", function()
    --   return require("opencode").operator("@this ") .. "_"
    -- end, { expr = true, desc = "Add line to opencode" })

    vim.keymap.set("n", "<S-C-u>", function()
      require("opencode").command("session.half.page.up")
    end, { desc = "opencode half page up" })
    vim.keymap.set("n", "<S-C-d>", function()
      require("opencode").command("session.half.page.down")
    end, { desc = "opencode half page down" })
    --
    -- -- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o".
    -- vim.keymap.set("n", "+", "<C-a>", { desc = "Increment", noremap = true })
    -- vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement", noremap = true })
  end,
}
