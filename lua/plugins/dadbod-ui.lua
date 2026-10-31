-- Registers a dadbod-ui connection for the current project from its .env / .env.local,
-- so credentials are read from the files when DBUI opens, never stored here.

-- Later files override earlier ones, as Next.js and dotenv-flow load them.
local env_files = { ".env", ".env.local" }
-- First key found wins: the direct (unpooled) connection suits an interactive client.
local url_keys = { "DATABASE_URL_UNPOOLED", "DATABASE_URL" }

local function read_env(path, vars)
  if vim.fn.filereadable(path) == 0 then
    return
  end
  for _, line in ipairs(vim.fn.readfile(path)) do
    local key, value = line:gsub("^%s*export%s+", ""):match("^%s*([%w_]+)%s*=%s*(.-)%s*$")
    if key then
      -- Quoted values are kept verbatim; unquoted ones drop a trailing `# comment`.
      vars[key] = value:match('^"(.*)"$') or value:match("^'(.*)'$") or (value:gsub("%s+#.*$", ""))
    end
  end
end

local function project_db()
  local cwd = vim.fn.getcwd()
  local root = vim.fs.root(cwd, ".git") or cwd
  local vars = {}
  for _, file in ipairs(env_files) do
    read_env(vim.fs.joinpath(root, file), vars)
  end
  for _, key in ipairs(url_keys) do
    if (vars[key] or "") ~= "" then
      local name = vim.fs.basename(root)
      if (vars.NEON_BRANCH or "") ~= "" then
        name = ("%s (%s)"):format(name, vars.NEON_BRANCH)
      end
      return { name = name, url = vars[key] }
    end
  end
end

local function set_dbs()
  vim.g.dbs = { project_db() }
end

return {
  "kristijanhusak/vim-dadbod-ui",
  optional = true,
  -- vim-dadbod-ui has no setup(), and `init` would replace the one from the sql extra.
  -- `config` runs on the first DBUI command, before it reads `g:dbs`.
  config = function()
    set_dbs()
    -- dadbod-ui re-reads `g:dbs` when the drawer is refreshed (`R`).
    local group = vim.api.nvim_create_augroup("lazyvim_dadbod_ui_dbs", { clear = true })
    vim.api.nvim_create_autocmd("DirChanged", { group = group, callback = set_dbs })
    vim.api.nvim_create_autocmd("BufWritePost", { group = group, pattern = env_files, callback = set_dbs })
  end,
}
