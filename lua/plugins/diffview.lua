return {
  {
    "dlyongemallo/diffview-plus.nvim",
    version = "*",
    cmd = {
      "DiffviewOpen",
      "DiffviewToggle",
      "DiffviewClose",
      "DiffviewFileHistory",
      "DiffviewDiffFiles",
      "DiffviewMergeFiles",
      "DiffviewDiffDirs",
      "DiffviewRefresh",
      "DiffviewFocusFiles",
      "DiffviewToggleFiles",
      "DiffviewLog",
    },
    keys = {
      { "<leader>gvv", "<cmd>DiffviewToggle<cr>", desc = "Toggle Diffview" },
      { "<leader>gvo", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
      { "<leader>gvc", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
      { "<leader>gvf", "<cmd>DiffviewFileHistory %<cr>", desc = "File History (current file)" },
      { "<leader>gvf", ":DiffviewFileHistory<cr>", mode = "x", desc = "File History (selection)" },
      { "<leader>gvF", "<cmd>DiffviewFileHistory<cr>", desc = "File History (repo)" },
      { "<leader>gvr", "<cmd>DiffviewRefresh<cr>", desc = "Refresh Diffview" },
    },
    opts = {},
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>gv", group = "diffview", icon = { icon = " ", color = "orange" } },
      },
    },
  },
}
