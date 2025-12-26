# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Overview

This is a modern Neovim configuration built with Lua, featuring integrated LSP support, extensive language tooling, and seamless tmux integration. The config uses Packer.nvim for plugin management and is organized around a modular Lua structure with plugin-specific configurations.

## Key Commands

### Plugin Management
- **Install/update plugins**: `:PackerSync` (syncs all plugins, installs missing ones)
- **Update plugins**: `:PackerUpdate`
- **Clean unused plugins**: `:PackerClean`
- **Compile plugin mappings**: `:PackerCompile`

### Language Servers & Formatters
- **Open Mason**: `<leader>M` (GUI for installing/managing LSP servers, formatters, linters)
- **Available LSP servers**: TypeScript, Python (pyright), Rust, Go, Swift, Lua, HTML, CSS, JSON, and more (managed via Mason)
- **Format file**: `<leader>fm` (uses none-ls/null-ls with prettier, black, stylua, shfmt)
- **Toggle format-on-save**: `<leader>ft`

### Development Workflows
- **Find files**: `<leader>ff` (Telescope fuzzy finder)
- **Live grep search**: `<leader>fw`
- **Git status**: `<leader>gs` or `<leader>lg` (LazyGit UI)
- **View diffs**: `<leader>dc` (DiffviewOpen)
- **File history**: `<leader>dh` (DiffviewFileHistory)
- **Buffer navigation**: `<leader>h` / `<leader>l` (prev/next buffer)
- **Close buffer**: `<leader>bd`

### Terminal Integration
- **Toggle terminal**: `<leader>t`
- **Float terminal**: `<leader>tt`
- **File browser in terminal**: `<leader>lf` (lf file manager)
- **Exit terminal mode**: `Esc`

## Architecture & Configuration Structure

### Directory Layout
```
~/.config/nvim/
├── init.lua              # Entry point, loads mircea module
├── lua/mircea/           # Core configuration
│   ├── init.lua          # Loads packer, remap, and set modules
│   ├── packer.lua        # Plugin declarations and bootstrap logic
│   ├── remap.lua         # All keybindings (~185 lines)
│   └── set.lua           # Neovim options and settings
├── after/plugin/         # Plugin-specific configurations (loaded after plugins)
│   ├── lsp.lua           # LSP configuration via lsp-zero
│   ├── null-ls.lua       # Formatting and code actions (none-ls fork)
│   ├── mason.lua         # Package manager setup
│   ├── telescope*.lua    # Fuzzy finder configuration
│   ├── rose-pine.lua     # Color theme setup
│   ├── treesitter.lua    # Syntax highlighting
│   └── [20+ more]        # Individual plugin configs
├── .tmux.conf            # Symlinked tmux configuration (seamless tmux/nvim navigation)
└── tmux.conf             # Actual tmux config file
```

### Core Configuration Modules

**lua/mircea/set.lua** - Neovim options:
- Line numbers (relative), indentation (4 spaces), word wrapping disabled
- Smart undo history, search highlighting, terminal colors (termguicolors)
- Sign column disabled, color column at 80, split behavior (below/right)

**lua/mircea/remap.lua** - All keybindings:
- Leader key: `Space`
- File operations, git commands, buffer management, terminal control
- LSP keybindings are configured in after/plugin/lsp.lua
- Split navigation uses vim-tmux-navigator (Ctrl+h/j/k/l works across tmux panes and Neovim splits)

**lua/mircea/packer.lua** - Plugin declarations:
- Bootstrap logic: automatically installs Packer if missing
- 40+ plugins covering LSP, UI, git, navigation, and development tools
- Uses `requires` for dependency management

### Plugin Categories

**LSP & Completion**:
- lsp-zero (wrapper framework), nvim-lspconfig, mason-lspconfig
- nvim-cmp (completion engine), LuaSnip (snippets)
- Completion sources: buffer, path, LSP, Lua, snippets

**UI & Theme**:
- rose-pine (color scheme), startup.nvim (custom dashboard), barbar.nvim (buffer tabs)
- nvim-notify (notifications), nvim-web-devicons (file icons)
- nvim-highlight-colors (color preview in code)

**Development Tools**:
- Telescope (fuzzy finder), harpoon (quick file switching)
- nvim-treesitter (syntax highlighting), trouble (quickfix list)
- Fugitive & LazyGit (git integration), gitsigns (git line indicators)
- DiffView (enhanced diff visualization), hologram.nvim (image viewing)

**Formatting & Linting**:
- none-ls (null-ls fork) with prettier, black, stylua, shfmt
- Supports JavaScript, TypeScript, Python, Lua, Shell, and more
- Format-on-save can be toggled

**Navigation & Editing**:
- vim-tmux-navigator (seamless pane/split navigation)
- vim-surround (text surrounding), vim-commentary (commenting)
- hop.nvim (fast cursor movement), undotree (visual undo history)
- nvim-surround (advanced text manipulation)

**AI Integration**:
- GitHub Copilot (github/copilot.vim) - code completion
- Claude Code (claude-code.nvim) - accessible via `<leader>cc`

## Installation & Setup

### Initial Setup
1. Clone or sync this config to `~/.config/nvim`
2. Start Neovim: `nvim`
3. Packer will auto-bootstrap on first launch
4. Run `:PackerSync` to install all plugins (may take a minute)
5. Restart Neovim

### LSP Server Installation
LSP servers are managed via Mason (`:Mason`). Common servers:
- **JavaScript/TypeScript**: ts_ls
- **Python**: pyright
- **Rust**: rust_analyzer
- **Go**: gopls
- **Swift**: sourcekit-lsp
- **Lua**: lua_ls

### Formatter Installation (via Mason)
- prettier (JS/TS/JSON/CSS/YAML/Markdown/etc)
- black (Python)
- stylua (Lua)
- shfmt (Shell)

## Tmux Integration

The configuration includes seamless tmux integration via vim-tmux-navigator. Both Neovim and tmux must have the plugin installed.

**Key Features**:
- `Ctrl+h/j/k/l` works across both tmux panes and Neovim splits
- Smart navigation automatically detects boundaries
- Tmux config is symlinked at `~/.tmux.conf` pointing to `.tmux/.tmux.conf`
- Uses tpm (Tmux Plugin Manager) for plugin management

**Setup Tmux**:
```bash
cp tmux.conf ~/.tmux.conf  # Copy from this repo
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source-file ~/.tmux.conf
# In tmux: Ctrl+a I (capital i) to install plugins
```

See `TMUX_SETUP.md` for detailed tmux configuration.

## Common Development Tasks

**Add/Modify Keybindings**: Edit `lua/mircea/remap.lua`
- Leader key is set at the top
- Use `vim.keymap.set()` with modes 'n'/'i'/'v'/'t' etc

**Configure LSP for a Language**: 
- Install server via `:Mason`
- Optionally add custom config in `after/plugin/lsp.lua` via `lsp.configure()`

**Add Formatters**:
- Install via `:Mason`
- Add to `sources` table in `after/plugin/null-ls.lua`

**Change Color Theme**:
- Default is rose-pine
- Alternative installed: tokyonight
- Change in `lua/mircea/packer.lua` or `after/plugin/rose-pine.lua`

**Add/Remove Plugins**: 
- Declare in `lua/mircea/packer.lua` using `use()` syntax
- Run `:PackerSync` to install
- Create corresponding config in `after/plugin/` if needed

## Important Notes

- **Lua version**: Neovim 0.7+ required (uses Lua configuration)
- **Terminal**: Configured for Kitty/WezTerm (recommended) or Alacritty
- **True color support**: Ensure terminal supports 24-bit colors
- **Packer bootstrap**: Automatically installs Packer if missing; subsequent runs use compiled version
- **Conflict with tmux**: Some keybindings (Ctrl+h/j/k/l, Ctrl+c) are disabled for tmux-navigator compatibility
- **Format on save**: Enabled by default but can be toggled with `<leader>ft`
- **LSP diagnostics**: Virtual text enabled; sign column disabled to save space
