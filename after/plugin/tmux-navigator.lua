-- Vim-Tmux Navigator Configuration
-- This enables seamless navigation between tmux panes and vim splits

-- The plugin automatically sets up these mappings:
-- <C-h> - Move to left split/pane
-- <C-j> - Move to bottom split/pane  
-- <C-k> - Move to top split/pane
-- <C-l> - Move to right split/pane
-- <C-\> - Move to previous split/pane

-- Disable tmux navigator when zooming the Vim pane
vim.g.tmux_navigator_no_mappings = 0
vim.g.tmux_navigator_save_on_switch = 2
vim.g.tmux_navigator_disable_when_zoomed = 1
vim.g.tmux_navigator_preserve_zoom = 1

-- Custom keymaps for tmux navigation (these work with the tmux config)
vim.keymap.set('n', '<C-h>', ':TmuxNavigateLeft<CR>', { silent = true })
vim.keymap.set('n', '<C-j>', ':TmuxNavigateDown<CR>', { silent = true })
vim.keymap.set('n', '<C-k>', ':TmuxNavigateUp<CR>', { silent = true })
vim.keymap.set('n', '<C-l>', ':TmuxNavigateRight<CR>', { silent = true })
vim.keymap.set('n', '<C-\\>', ':TmuxNavigatePrevious<CR>', { silent = true })

-- Also set up in insert mode for convenience
vim.keymap.set('i', '<C-h>', '<ESC>:TmuxNavigateLeft<CR>', { silent = true })
vim.keymap.set('i', '<C-j>', '<ESC>:TmuxNavigateDown<CR>', { silent = true })
vim.keymap.set('i', '<C-k>', '<ESC>:TmuxNavigateUp<CR>', { silent = true })
vim.keymap.set('i', '<C-l>', '<ESC>:TmuxNavigateRight<CR>', { silent = true })

-- Terminal mode mappings (for terminal buffers in nvim)
vim.keymap.set('t', '<C-h>', '<C-\\><C-n>:TmuxNavigateLeft<CR>', { silent = true })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n>:TmuxNavigateDown<CR>', { silent = true })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n>:TmuxNavigateUp<CR>', { silent = true })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n>:TmuxNavigateRight<CR>', { silent = true })

-- Function to check if tmux is running
local function is_tmux()
  return vim.env.TMUX ~= nil
end

-- Display tmux status on startup
vim.defer_fn(function()
  if is_tmux() then
    vim.notify("Tmux navigation enabled (C-hjkl)", vim.log.levels.INFO, {
      title = "Tmux Navigator",
      timeout = 1500,
    })
  end
end, 500)