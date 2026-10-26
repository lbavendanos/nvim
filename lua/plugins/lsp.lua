-- LSP floats with one look: rounded borders, a little inner padding and a capped width
-- hover/signature help (K, gK, <c-k>) are rendered by noice, completion by blink.cmp
return {
  {
    "folke/noice.nvim",
    optional = true,
    opts = {
      presets = {
        lsp_doc_border = true,
      },
      views = {
        hover = {
          border = { padding = { 0, 1 } },
          size = { max_width = 80 },
        },
      },
    },
  },
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      completion = {
        menu = { border = "rounded" },
        documentation = { window = { border = "rounded" } },
      },
      signature = { window = { border = "rounded" } },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        float = {
          border = "rounded",
          source = "if_many",
        },
      },
    },
  },
}
