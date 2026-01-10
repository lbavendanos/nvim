# CLAUDE.md

This file provides guidance to Claude Code when working with this repository.

## Before You Start

**Always consult Context7 MCP before making changes.** When adding or modifying plugin configurations, use Context7 to query the official documentation of the plugins/libraries involved. This ensures configurations follow current best practices and use up-to-date APIs.

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

## Code Style

Lua files are formatted with StyLua. Configuration in `stylua.toml`.
