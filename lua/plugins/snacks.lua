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
        },
        {
          text = {
            "Simplicity is the ultimate sophistication",
            hl = "Comment",
            align = "center",
          },
          padding = 1,
        },
        {
          text = {
            { "type  :help nvim<Enter>         if you are new!    ", hl = "NonText" },
          },
          align = "center",
        },
        {
          text = {
            { "type  :checkhealth<Enter>       to optimize Neovim ", hl = "NonText" },
          },
          align = "center",
        },
        {
          text = {
            { "type  :q<Enter>                 to exit            ", hl = "NonText" },
          },
          align = "center",
        },
        {
          text = {
            { "type  :help news<Enter>         for changes in vX.X", hl = "NonText" },
          },
          align = "center",
          padding = 1,
        },
        { section = "startup" },
      },
    },
    indent = { enabled = false },
    scroll = { enabled = false },
  },
}
