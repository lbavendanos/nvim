# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a LazyVim-based Neovim configuration optimized for web development, with a focus on PHP (Laravel/Pest), TypeScript, and modern frontend frameworks. The configuration uses lazy.nvim as the plugin manager and follows LazyVim's conventions for plugin organization.

## Architecture

### Core Structure

- **init.lua**: Entry point that bootstraps config.lazy
- **lua/config/**: Core configuration files (lazy.nvim setup, options, keymaps, autocmds)
- **lua/plugins/**: Individual plugin specifications (one file per plugin)

### Plugin System

The configuration uses LazyVim's plugin architecture:

1. LazyVim base plugins are imported via `import = "lazyvim.plugins"`
2. Custom plugins in `lua/plugins/` extend or override LazyVim defaults
3. LazyVim extras are enabled via `lazyvim.json` (extras like copilot, typescript, php, prettier, eslint)

### Key Patterns

**Overriding LazyVim plugins**: Use `optional = true` when modifying an existing LazyVim plugin:

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

**Extending opts with functions**: When you need to modify existing options:

```lua
opts = function(_, opts)
  -- Modify opts table
  opts.sources = opts.sources or {}
  table.insert(opts.sources, new_source)
end
```

**Filtering unwanted sources**: See lua/plugins/none-ls.lua:8-10 for pattern of filtering out default sources using `vim.tbl_filter`

## Commands

### Lua Formatting

```bash
stylua lua/                              # Format all Lua files
stylua lua/plugins/colorscheme.lua       # Format a single file
stylua --check lua/                      # Check without writing
```

### Neovim Commands

```vim
:Lazy update          " Update plugins
:Lazy sync            " Sync plugins (install missing, remove unused)
:checkhealth          " Check overall health
:checkhealth lazyvim  " Check LazyVim health
:Mason                " Manage LSP servers and tools
```

### Testing (PHP projects)

```vim
:Neotest run          " Run all tests
:Neotest run file     " Run current test file
:Neotest run nearest  " Run nearest test
:Neotest watch        " Watch tests
```

## Code Style

### StyLua Configuration

- Indent: 2 spaces
- Column width: 120 characters
- Configuration: stylua.toml

### Plugin Files

- Each plugin has its own file in `lua/plugins/`
- Naming: lowercase with hyphens (e.g., `visual-multi.lua`, `nvim-lint.lua`)
- Always include `desc` field in keymaps for which-key integration

## Language Support

### PHP (Primary)

- **Formatter**: Pint (Laravel's code style fixer)
- **Linter**: PHPStan with 2G memory limit
- **Testing**: Pest via neotest-pest
- **LSP**: Intelephense (via LazyVim php extra)

Note: phpcs and phpcsfixer are explicitly filtered out in lua/plugins/none-ls.lua:9 in favor of Pint

### TypeScript/JavaScript

- **Formatter**: Prettier
- **Linter**: ESLint
- **LSP**: TypeScript language server (via LazyVim typescript extra)

## Important Configuration Defaults

- **Autoformat is disabled by default** (`vim.g.autoformat = false`)
- **Colorscheme**: kanagawa-dragon with transparent background
- **Tab management**: tabline.nvim (bufferline.nvim is disabled)

## Common Development Tasks

When modifying plugins:

1. Read the existing plugin file first to understand current configuration
2. Check if the plugin is a LazyVim default (use `optional = true` if so)
3. Follow the opts function pattern when extending existing configuration
4. Run `:Lazy sync` after adding new plugins
5. Format with StyLua before committing

When debugging:

1. Run `:checkhealth` to identify issues
2. Check `:Lazy` to see plugin status
3. Use `:Mason` to verify LSP tools are installed
