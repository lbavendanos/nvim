return {
  "nvimtools/none-ls.nvim",
  optional = true,
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.sources = opts.sources or {}

    opts.sources = vim.tbl_filter(function(source)
      return not (source.name == "phpcs" or source.name == "phpcsfixer")
    end, opts.sources or {})

    table.insert(opts.sources, nls.builtins.formatting.pint)
    table.insert(
      opts.sources,
      nls.builtins.diagnostics.phpstan.with({
        extra_args = {
          "--memory-limit=2G",
        },
      })
    )
  end,
}
