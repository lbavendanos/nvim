return {
  "nvim-neotest/neotest",
  dependencies = {
    -- "V13Axel/neotest-pest",
    { "jradtilbrook/neotest-pest", branch = "ts-fix" },
  },
  opts = {
    adapters = {
      "neotest-pest",
    },
  },
}
