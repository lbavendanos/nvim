# AGENTS.md

## Before You Start

**Always consult Context7 MCP before making changes.** When adding or modifying plugin configurations, use Context7 to query the official documentation of the plugins/libraries involved. This ensures configurations follow current best practices and use up-to-date APIs.

## Repository

LazyVim-based Neovim configuration using lazy.nvim as plugin manager.

- `lua/config/` - Core configuration (lazy.nvim setup, options, keymaps, autocmds)
- `lua/plugins/` - Plugin specifications (one file per plugin)
- `lazyvim.json` - Enabled LazyVim extras

## Plugins

### Adding a new plugin

Every new plugin must be configured as if it shipped with LazyVim. Follow these rules in order:

1. **Prefer an extra.** If LazyVim ships an extra for the plugin (`~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/plugins/extras/`), enable it in `lazyvim.json` instead of writing a spec. To customize it, follow [Modifying an existing plugin](#modifying-an-existing-plugin).
2. **Install as documented.** Use the exact repo and install options from the plugin's README (e.g. `version = "*"` when it recommends releases). If Context7 has no entry for the plugin (forks, new plugins), read the installed source under `~/.local/share/nvim/lazy/<plugin>/` (`README.md`, `plugin/`, `doc/`) instead of guessing.
3. **Always lazy-load.** Use `cmd`, `keys`, `event` (e.g. `"LazyFile"`, `"VeryLazy"`), or `ft` as fits the plugin. Never use `lazy = false` unless the plugin's docs require it. List every user command the plugin defines in `cmd`. Never set `optional = true` on the plugin's own spec, or it will never be installed.
4. **Configure with `opts`, not `config`.** Use `opts = {}` (or a table/function) so lazy.nvim calls `setup()` and other specs can merge into it. Only write `config` when the plugin has no `setup(opts)` entry point.
5. **Define keymaps in the spec's `keys`.** Each key needs a `desc`. Use `<cmd>...<cr>` for normal-mode maps and `:...<cr>` when a visual range must be passed. Don't put plugin keymaps in `lua/config/keymaps.lua`.
6. **Avoid keymap conflicts.** Before picking a key, check that it is free:
   - LazyVim defaults and enabled extras: `grep -rn '"<leader>x' ~/.local/share/nvim/lazy/LazyVim/lua`
   - This config: `grep -rn '"<leader>x' lua/`

   Use a free prefix under the matching LazyVim category (`<leader>g` git, `<leader>c` code, `<leader>s` search, `<leader>u` toggles, etc.) and group related maps under a sub-prefix.

7. **Register which-key groups** for new prefixes, with an icon, in the same plugin file:

   ```lua
   {
     "folke/which-key.nvim",
     optional = true,
     opts = {
       spec = {
         { "<leader><prefix>", group = "<name>", icon = { icon = "<nerd-font-glyph> ", color = "<color>" } },
       },
     },
   }
   ```

   Pick a Nerd Font glyph that represents the plugin's purpose. `color` must be one of which-key's icon colors: `azure`, `blue`, `cyan`, `green`, `grey`, `orange`, `purple`, `red`, `yellow`.

8. **Verify before finishing.** Run StyLua (see [Code Style](#code-style)) and start Neovim headless to confirm the spec loads without errors and the keymaps are registered.

### Modifying an existing plugin

- **LazyVim core plugin:** declare the same plugin with only the fields you change (`opts`, `keys`, etc.); LazyVim merges them with its defaults. `optional` is not needed.
- **Plugin from an extra, or another plugin's integration** (e.g. which-key groups): add `optional = true` so the spec is ignored when that plugin isn't enabled.

## Code Style

Lua files are formatted with StyLua (configuration in `stylua.toml`). StyLua is installed via Mason, not on `PATH`: check with `~/.local/share/nvim/mason/bin/stylua --check lua/`.
