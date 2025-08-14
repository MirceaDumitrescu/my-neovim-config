# my-neovim-config

A modern, feature-rich Neovim configuration optimized for development with beautiful UI and seamless workflow integration.

## Quick Start

1. Clone this repository to your Neovim config directory:
   ```bash
   git clone https://github.com/MirceaDumitrescu/my-neovim-config ~/.config/nvim
   ```

2. Install dependencies:
   ```bash
   nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
   ```

3. Restart Neovim and enjoy!

## Terminal Setup

**Primary Terminal**: Kitty/WezTerm (recommended) or Alacritty  
**Tmux Integration**: Seamless navigation between tmux panes and Neovim splits

## ✨ Features

### 🎨 **Beautiful Interface**
- **Rose Pine Theme** - Elegant, easy on the eyes color scheme
- **Custom Startup Screen** - Personalized greeting with quick actions
- **File Icons** - Colorful file type icons throughout the interface
- **Notification System** - Beautiful, non-intrusive notifications

### 🔍 **Powerful Navigation & Search**
- **Telescope Fuzzy Finder** - Find files, text, git files, and more
- **Harpoon** - Quick file switching and project navigation
- **Tmux Navigator** - Seamless navigation between tmux panes and Neovim splits

### 💻 **Development Tools**
- **LSP Support** - Configured for multiple languages:
  - JavaScript/TypeScript (tsserver)
  - Python (pyright)
  - Rust (rust_analyzer)
  - Go (gopls)
  - Swift (sourcekit-lsp)
  - Lua (lua_ls)
  - HTML, CSS, JSON, and more
- **Auto-formatting** - Prettier, Black, Stylua, and more via none-ls
- **Mason Package Manager** - Easy LSP server and formatter management
- **GitHub Copilot** - AI-powered code completion

### 🎯 **Code Quality**
- **Syntax Highlighting** - TreeSitter-powered, accurate highlighting
- **Diagnostics** - Real-time error detection and suggestions
- **Code Actions** - Quick fixes and refactoring tools
- **Auto-completion** - Intelligent code completion with nvim-cmp

### 🔧 **Productivity Features**
- **Buffer Management** - Advanced buffer and tab handling with BarBar
- **Git Integration** - LazyGit, Fugitive, and Gitsigns for version control
- **Diff Viewer** - Built-in diff visualization
- **Image Viewing** - Display images directly in Neovim (hologram.nvim)
- **Color Highlighting** - Live color preview in CSS/code
- **Todo Comments** - Highlight and navigate TODO/FIXME comments

### ⚡ **Enhanced Editing**
- **Surround** - Quick text surrounding operations
- **Commentary** - Easy code commenting/uncommenting  
- **Undotree** - Visual undo history
- **Trouble** - Better quickfix and location lists
- **Refactoring** - Advanced refactoring tools
- **Hop** - Lightning-fast cursor movement

## 🎮 Key Bindings

### Leader Key: `Space`

#### File Operations
- `<leader>ff` - Find files
- `<leader>fr` - Recent files  
- `<leader>fw` - Find text (live grep)
- `<leader>fn` - New file

#### Git Operations  
- `<leader>gs` - Git status
- `<leader>lg` - LazyGit
- `<leader>dc` - Diff view
- `<leader>dh` - File history

#### Navigation
- `Ctrl+h/j/k/l` - Navigate between splits/tmux panes
- `<leader>h/l` - Switch buffers
- `<leader>e` - File explorer

#### Formatting & Tools
- `<leader>fm` - Format file
- `<leader>ft` - Toggle format on save
- `<leader>M` - Open Mason package manager
- `<leader>cc` - Claude Code integration

#### Utility
- `<leader>db` - Dashboard/startup screen
- `<leader>nh` - Notification history
- `<leader>pu` - Update plugins

## 📁 Project Structure

```
~/.config/nvim/
├── after/plugin/          # Plugin configurations
│   ├── claude-code.lua     # AI integration
│   ├── mason.lua          # Package manager
│   ├── null-ls.lua        # Formatting & linting
│   ├── rose-pine.lua      # Color theme
│   ├── startup.lua        # Custom startup screen
│   └── ...
├── lua/mircea/            # Core configuration
│   ├── init.lua           # Main entry point
│   ├── packer.lua         # Plugin management
│   ├── remap.lua          # Key mappings
│   └── set.lua            # Neovim settings
├── lua/startup_theme.lua  # Custom startup theme
└── README.md
```

## 🔧 Tmux Integration

This configuration includes seamless tmux integration. The included tmux configuration features:

- **Smart Pane Navigation** - `Ctrl+h/j/k/l` works between Neovim splits and tmux panes
- **Modern Theme** - Matching color scheme with icons and status indicators
- **Session Management** - Advanced session handling with resurrect/continuum
- **Copy Mode Improvements** - Enhanced text selection and copying

## 🎯 Plugin Highlights

### Core Plugins
- **Packer.nvim** - Plugin manager
- **Telescope.nvim** - Fuzzy finder and picker
- **nvim-treesitter** - Syntax highlighting and parsing
- **lsp-zero** - LSP configuration framework
- **nvim-cmp** - Completion engine

### UI Enhancement
- **rose-pine** - Beautiful color scheme
- **startup.nvim** - Custom startup screen
- **nvim-web-devicons** - File icons
- **nvim-notify** - Notification system
- **barbar.nvim** - Buffer tabs

### Development Tools
- **mason.nvim** - Package manager for LSP servers
- **none-ls.nvim** - Formatting and linting
- **prettier.nvim** - Code formatting
- **gitsigns.nvim** - Git indicators
- **vim-tmux-navigator** - Tmux integration

## 🚀 Performance

This configuration is optimized for performance with:
- Lazy loading of plugins where appropriate
- Efficient keybinding setup
- Minimal startup time
- Smart autocompletion
- Optimized TreeSitter configuration

## 🤝 Contributing

Feel free to fork this configuration and make it your own! If you have improvements or bug fixes, pull requests are welcome.

## 📝 Screenshots

### Clean Start
![image](https://user-images.githubusercontent.com/16415899/234887976-175e6aa8-94ba-4812-9b95-14aa04d6b68d.png)

### Telescope fuzzy finder
![image](https://user-images.githubusercontent.com/16415899/234888176-fd28d560-2e99-4bfa-91b3-e2427bd03454.png)

### Working with Harpoon
![image](https://user-images.githubusercontent.com/16415899/234888429-2df78806-216f-484a-ab8c-47b98707a89b.png)

### LSP configured for most languages
![image](https://user-images.githubusercontent.com/16415899/234889359-ee00859e-b1b6-4de7-927d-1359011229a3.png)

### LazyGit Integration
![image](https://user-images.githubusercontent.com/16415899/234889456-7e9e8895-537e-41e7-bdb0-4fb53b613c9c.png)

---

**Thanks for checking it out! Leave feedback and ⭐ if you find it useful!**