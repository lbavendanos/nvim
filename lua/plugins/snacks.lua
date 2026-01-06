return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      sections = {
        {
          text = {
            " ",
            hl = "Operator",
            align = "center",
          },
        },
        {
          text = {
            "Avendano",
            hl = "Number",
            align = "center",
          },
          padding = 1,
        },
        { section = "startup" },
      },
    },
    indent = { enabled = false },
    scroll = { enabled = false },
  },
}
