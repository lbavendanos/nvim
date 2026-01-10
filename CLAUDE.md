# CLAUDE.md

This file provides guidance to Claude Code when working with this repository.

## Repository Overview

LazyVim-based Neovim configuration. Uses lazy.nvim as plugin manager and follows LazyVim conventions.

## Structure

- `lua/config/` - Core configuration (lazy.nvim setup, options, keymaps, autocmds)
- `lua/plugins/` - Plugin specifications (one file per plugin)
- `lazyvim.json` - Enabled LazyVim extras

## Key Patterns

When modifying LazyVim default plugins, use `optional = true`:

```lua
return {
  "plugin/name",
  optional = true,
  opts = { ... },
}
```

Use **Context7 MCP** for up-to-date documentation when adding or modifying configurations and plugins.

## Code Style

Lua files are formatted with StyLua. Configuration in `stylua.toml`.
