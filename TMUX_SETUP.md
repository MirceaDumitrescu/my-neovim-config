# Tmux Configuration Setup

This repository includes a modern tmux configuration that seamlessly integrates with Neovim.

## Installation

1. **Copy the tmux configuration:**
   ```bash
   cp tmux.conf ~/.tmux.conf
   ```

2. **Install TPM (Tmux Plugin Manager):**
   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

3. **Reload tmux configuration:**
   ```bash
   tmux source-file ~/.tmux.conf
   ```

4. **Install plugins:**
   - Start tmux: `tmux`
   - Press `Ctrl+a` then `I` (capital i) to install plugins

## Features

### 🎨 **Modern Theme**
- Beautiful color scheme matching the Neovim Rose Pine theme
- Icons and visual indicators throughout the status bar
- Clean, professional appearance

### 🔧 **Smart Navigation**
- `Ctrl+h/j/k/l` - Navigate between tmux panes AND Neovim splits seamlessly
- `Alt+Arrow Keys` - Alternative navigation without prefix
- `Ctrl+a` - Prefix key (more ergonomic than default Ctrl+b)

### ⚡ **Enhanced Productivity**
- `Ctrl+a |` - Split window horizontally
- `Ctrl+a -` - Split window vertically
- `Ctrl+a r` - Reload configuration
- `Ctrl+a b` - Break pane into new window

### 📋 **Improved Copy Mode**
- Vim-style key bindings in copy mode
- Better text selection and copying
- Integration with system clipboard (pbcopy on macOS)

### 🔄 **Session Management**
- **tmux-resurrect** - Save and restore tmux sessions
- **tmux-continuum** - Automatic session saving every 15 minutes
- Sessions persist across reboots

### 📊 **Status Bar Information**
- Current session, window, and pane indicators
- Date and time display
- Hostname display
- Prefix highlight when active
- Activity monitoring

## Key Bindings

### Navigation
- `Ctrl+h/j/k/l` - Navigate panes/vim splits
- `Alt+Arrow` - Navigate panes without prefix
- `Ctrl+a Tab` - Switch to last window
- `Ctrl+a Ctrl+h/l` - Switch windows

### Window/Pane Management
- `Ctrl+a |` - Split horizontally
- `Ctrl+a -` - Split vertically
- `Ctrl+a c` - Create new window
- `Ctrl+a b` - Break pane to new window
- `Ctrl+a H/J/K/L` - Resize panes

### Copy Mode
- `Ctrl+a [` - Enter copy mode
- `v` - Start selection
- `y` - Copy selection
- `Ctrl+v` - Rectangle selection

### Session Management
- `Ctrl+a s` - List sessions
- `Ctrl+a $` - Rename session
- `Ctrl+a d` - Detach session

## Plugin List

1. **tpm** - Tmux Plugin Manager
2. **tmux-sensible** - Sensible default settings
3. **vim-tmux-navigator** - Seamless vim/tmux navigation
4. **tmux-resurrect** - Save/restore sessions
5. **tmux-continuum** - Automatic session saving
6. **tmux-yank** - Better clipboard integration
7. **tmux-prefix-highlight** - Visual prefix indicator

## Troubleshooting

### Navigation not working between Neovim and tmux
1. Make sure vim-tmux-navigator is installed in both tmux and Neovim
2. Restart both tmux and Neovim after configuration changes

### Plugins not installing
1. Make sure TPM is installed: `ls ~/.tmux/plugins/tpm`
2. Try manual installation: `~/.tmux/plugins/tpm/bin/install_plugins`
3. Check tmux version: `tmux -V` (requires 2.1+)

### Colors not displaying correctly
1. Make sure your terminal supports true color
2. Set `TERM` environment variable: `export TERM=screen-256color`
3. Check terminal-specific settings

## Customization

The configuration is highly customizable. Key sections to modify:

- **Colors**: Lines 123-151 for theme colors
- **Key bindings**: Lines 78-111 for custom shortcuts  
- **Status bar**: Lines 128-135 for status bar content
- **Plugins**: Lines 158-165 for additional plugins

---

Enjoy your enhanced tmux experience! 🚀