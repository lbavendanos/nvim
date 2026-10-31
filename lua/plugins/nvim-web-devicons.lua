return {
  { "nvim-mini/mini.icons", enabled = false },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = {
      -- icons LazyVim adds to mini.icons that nvim-web-devicons lacks
      -- (colors are kanagawa-dragon's MiniIcons* highlights)
      override_by_filename = {
        [".keep"] = { icon = "󰊢", color = "#c5c9c5", name = "Keep" },
        ["devcontainer.json"] = { icon = "", color = "#949fb5", name = "Devcontainer" },
        [".eslintrc.js"] = { icon = "󰱺", color = "#c4b28a", name = "EslintrcJs" },
        [".node-version"] = { icon = "", color = "#8a9a7b", name = "NodeVersion" },
        [".yarnrc.yml"] = { icon = "", color = "#8ba4b0", name = "Yarnrc" },
        ["tsconfig.build.json"] = { icon = "", color = "#949fb5", name = "TSConfigBuild" },
        ["yarn.lock"] = { icon = "", color = "#8ba4b0", name = "YarnLock" },
        -- target of the env filetype mapping below
        ["dotenv"] = { icon = "", color = "#c4b28a", name = "Dotenv" },
      },
    },
    config = function(_, opts)
      local devicons = require("nvim-web-devicons")
      -- file lookups match exact names only, so list the common .env variants
      local dotenv = opts.override_by_filename["dotenv"]
      for _, suffix in ipairs({
        "",
        ".local",
        ".example",
        ".sample",
        ".template",
        ".test",
        ".development",
        ".production",
        ".staging",
      }) do
        opts.override_by_filename[".env" .. suffix] = dotenv
        opts.override_by_filename[".env" .. suffix .. ".local"] = dotenv
      end
      devicons.setup(opts)
      -- setup() has no option for filetype -> icon mappings
      devicons.set_icon_by_filetype({ env = "dotenv" })
    end,
  },
}
