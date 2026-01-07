# AGENTS.md - Neovim Configuration

This is a LazyVim-based Neovim configuration for web development, with a focus on PHP (Laravel/Pest), TypeScript, and modern frontend frameworks.

## Project Structure

```
~/.config/nvim/
├── init.lua                 # Entry point - bootstraps config.lazy
├── lua/
│   ├── config/              # Core configuration
│   │   ├── lazy.lua         # lazy.nvim plugin manager setup
│   │   ├── options.lua      # Vim options
│   │   ├── keymaps.lua      # Custom keybindings
│   │   └── autocmds.lua     # Autocommands
│   └── plugins/             # Plugin specifications (one file per plugin)
├── stylua.toml              # Lua formatter configuration
├── lazyvim.json             # LazyVim extras configuration
├── lazy-lock.json           # Plugin version lockfile
└── .neoconf.json            # LSP settings for neoconf
```

## Build/Lint/Test Commands

### Lua Formatting

```bash
# Format all Lua files
stylua lua/

# Format a single file
stylua lua/plugins/colorscheme.lua

# Check formatting without writing
stylua --check lua/
```

### Neovim Commands (run inside Neovim)

```vim
" Update plugins
:Lazy update

" Sync plugins (install missing, remove unused)
:Lazy sync

" Check plugin health
:checkhealth

" Check LazyVim health
:checkhealth lazyvim

" Mason - install/update LSP servers and tools
:Mason

" Format current buffer (if autoformat is enabled or manually triggered)
:lua vim.lsp.buf.format()
```

### Testing (for PHP projects using this config)

```vim
" Run all tests
:Neotest run

" Run current test file
:Neotest run file

" Run nearest test
:Neotest run nearest

" Watch tests
:Neotest watch
```

## Code Style Guidelines

### StyLua Configuration

From `stylua.toml`:

- **Indent type:** Spaces
- **Indent width:** 2 spaces
- **Column width:** 120 characters

### Plugin File Structure

Each plugin should have its own file in `lua/plugins/`. Use this pattern:

```lua
return {
  "author/plugin-name",
  optional = true,  -- Use when modifying an optional/extra plugin
  dependencies = {
    "dependency/plugin",
  },
  opts = {
    -- Configuration options (preferred over config function)
  },
  -- Or for complex setup:
  config = function()
    -- Setup code
  end,
  keys = {
    -- Keybindings
  },
  cmd = { "Command1", "Command2" },  -- Lazy-load on commands
  event = "BufReadPost",              -- Lazy-load on event
}
```

### Naming Conventions

- **Files:** lowercase with hyphens for multi-word names (`visual-multi.lua`, `nvim-lint.lua`)
- **Plugin configs:** named after the plugin they configure
- **Variables:** snake_case for Lua variables
- **Vim options:** use `vim.opt.option_name` or `vim.g.global_var`

### Import Patterns

```lua
-- Require modules
local nls = require("null-ls")

-- Vim API usage
vim.opt.mouse = ""
vim.g.autoformat = false
vim.api.nvim_echo({...}, true, {})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Description", silent = true })
```

### Keymap Definitions

Always include a `desc` field for which-key integration:

```lua
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {
  desc = "Move selected line(s) down",
  silent = true,
})
```

### Modifying LazyVim Defaults

When overriding LazyVim plugins, use `optional = true`:

```lua
return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      php = { "pint" },
    },
  },
}
```

### Disabling Plugins

```lua
return {
  { "akinsho/bufferline.nvim", enabled = false },
}
```

### Extending Options with Functions

When you need to modify existing options:

```lua
return {
  "nvimtools/none-ls.nvim",
  optional = true,
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.sources = opts.sources or {}
    -- Filter out unwanted sources
    opts.sources = vim.tbl_filter(function(source)
      return not (source.name == "phpcs")
    end, opts.sources)
    -- Add new sources
    table.insert(opts.sources, nls.builtins.formatting.pint)
  end,
}
```

## Enabled LazyVim Extras

From `lazyvim.json`:

- **AI:** copilot
- **Coding:** mini-comment, mini-surround
- **Editor:** neo-tree, refactoring
- **Formatting:** prettier
- **Languages:** php, sql, tailwind, typescript
- **Linting:** eslint
- **LSP:** neoconf, none-ls
- **Testing:** core

## Tooling Configuration

### PHP Tooling

- **Formatter:** Pint (Laravel's code style fixer)
- **Linter:** PHPStan with 2G memory limit
- **Testing:** Pest via neotest-pest

### JavaScript/TypeScript Tooling

- **Formatter:** Prettier
- **Linter:** ESLint
- **LSP:** TypeScript language server (via LazyVim extra)

### Mason Ensure Installed

Tools automatically installed via Mason:

- `pint`
- `phpstan`

## Error Handling Patterns

For bootstrap/initialization errors:

```lua
if vim.v.shell_error ~= 0 then
  vim.api.nvim_echo({
    { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
    { out, "WarningMsg" },
    { "\nPress any key to exit..." },
  }, true, {})
  vim.fn.getchar()
  os.exit(1)
end
```

## Important Notes

- **Autoformat is disabled by default** (`vim.g.autoformat = false`)
- **Mouse is disabled** (`vim.opt.mouse = ""`)
- **Case-sensitive search** (`vim.opt.ignorecase = false`)
- **Colorscheme:** kanagawa-dragon with transparent background
- **Tab management:** tabline.nvim (bufferline.nvim is disabled)

## Files to Ignore

From `.gitignore`: `tt.*`, `.tests`, `doc/tags`, `debug`, `.repro`, `foo.*`, `*.log`, `data`
