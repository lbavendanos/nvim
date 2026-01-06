return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters_by_ft = {
      php = { "phpstan" },
    },
    linters = {
      phpstan = {
        cmd = "phpstan",
        args = { "analyze", "--error-format=json", "--memory-limit=2G", "--no-progress" },
      },
    },
  },
}
