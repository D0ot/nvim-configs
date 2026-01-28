# Project: Neovim Configuration

## Overview
This is a personal Neovim configuration based on Lua. It uses **lazy.nvim** as the plugin manager and features a modular structure. The configuration provides a full-featured IDE-like experience with LSP support, autocompletion, file explorer, fuzzy finding, and AI integration via Avante.

## Directory Structure

- **`init.lua`**: The entry point of the configuration.
- **`lua/`**: Core configuration modules.
  - **`bootstrap.lua`**: Bootstraps `lazy.nvim`.
  - **`plugins/`**: Contains individual plugin configurations (loaded by `lazy.nvim`).
  - **`lsp.lua`**: Main configuration for Language Server Protocol (LSP) setup.
  - **`settings.lua`**: General editor options (vim.opt, vim.g).
  - **`keymaps.lua`**: Global keybindings.
  - **`autocmd.lua`**: Autocommands and event handlers.
  - **`utils.lua`**: Utility functions.
- **`ftplugin/`**: Filetype-specific configurations.

## Key Components

### Plugin Management
- **Manager**: `folke/lazy.nvim`
- **Configuration**: `lua/plugins/lazy.lua` defines the plugins and their load order/dependencies. Individual plugin configs are typically found in `lua/plugins/` (e.g., `lua/plugins/telescope.lua`).

### LSP & Completion
- **LSP Setup**:
  - `lua/lsp.lua` handles the core LSP client configuration (attaching servers, keymaps).
  - `williamboman/mason.nvim` is used for managing external tooling (LSP servers, linters).
  - **Note**: There is a `lua/plugins/nvim-lspconfig.lua` file, but the active LSP logic appears to reside in `lua/lsp.lua` using direct `vim.lsp` calls or a custom wrapper.
- **Completion**: `hrsh7th/nvim-cmp` with `LuaSnip` for snippets.
- **UI**: `glepnir/lspsaga.nvim` provides an enhanced UI for LSP interactions (code actions, finder, hover).

### UI & UX
- **Theme**: `navarasu/onedark.nvim`
- **Status Line**: `nvim-lualine/lualine.nvim`
- **Bufferline**: `romgrk/barbar.nvim`
- **Explorer**: `nvim-tree/nvim-tree.lua` (File explorer)
- **Fuzzy Finder**: `nvim-telescope/telescope.nvim`
- **Terminal**: `akinsho/toggleterm.nvim`
- **AI Assistant**: `yetone/avante.nvim`

## Keybindings
- **Leader Key**: Space (` `)
- **Core Mappings**: Defined in `lua/keymaps.lua` (e.g., window navigation, spell check toggle).
- **LSP Mappings**: Defined in `lua/lsp.lua` (attached on LSP server start).
  - `gd`: Go to definition
  - `gr`: Find references (using Lspsaga)
  - `<leader>ca`: Code action
  - `K`: Hover doc

## Development & Customization
- **Adding Plugins**: Add a new entry to `lua/plugins/lazy.lua` or create a new file in `lua/plugins/` and require it (though the current setup suggests adding to the big list in `lazy.lua` or ensuring the directory is scanned).
- **LSP Servers**: To enable a new server, ensure it is installed (via Mason) and configure it in `lua/lsp.lua` (using the `vim.lsp.config/enable` pattern seen there).
