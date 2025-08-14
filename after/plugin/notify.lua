local status_ok, notify = pcall(require, "notify")
if not status_ok then
  return
end

notify.setup({
  -- Animation style
  stages = "fade_in_slide_out",
  
  -- Function to render notifications
  render = "compact",
  
  -- Default timeout for notifications
  timeout = 3000,
  
  -- Background color
  background_colour = "#000000",
  
  -- Minimum width for notification windows
  minimum_width = 50,
  
  -- Icons for different log levels
  icons = {
    ERROR = " ",
    WARN = " ",
    INFO = " ",
    DEBUG = " ",
    TRACE = "✎ ",
  },
  
  -- Maximum height of notification window
  max_height = function()
    return math.floor(vim.o.lines * 0.75)
  end,
  
  -- Maximum width of notification window
  max_width = function()
    return math.floor(vim.o.columns * 0.75)
  end,
  
  -- Notification opacity
  on_open = function(win)
    vim.api.nvim_win_set_config(win, { zindex = 100 })
  end,
  
  -- Frames per second
  fps = 30,
  
  -- Level (minimum level to show)
  level = vim.log.levels.INFO,
  
  -- Top-down notifications
  top_down = true,
})

-- Set as default vim.notify
vim.notify = notify

-- Create custom highlights for notifications to match Rose Pine theme
vim.cmd([[
  highlight NotifyERRORBorder guifg=#eb6f92
  highlight NotifyWARNBorder guifg=#f6c177
  highlight NotifyINFOBorder guifg=#9ccfd8
  highlight NotifyDEBUGBorder guifg=#c4a7e7
  highlight NotifyTRACEBorder guifg=#e0def4
  highlight NotifyERRORIcon guifg=#eb6f92
  highlight NotifyWARNIcon guifg=#f6c177
  highlight NotifyINFOIcon guifg=#9ccfd8
  highlight NotifyDEBUGIcon guifg=#c4a7e7
  highlight NotifyTRACEIcon guifg=#e0def4
  highlight NotifyERRORTitle guifg=#eb6f92
  highlight NotifyWARNTitle guifg=#f6c177
  highlight NotifyINFOTitle guifg=#9ccfd8
  highlight NotifyDEBUGTitle guifg=#c4a7e7
  highlight NotifyTRACETitle guifg=#e0def4
]])

-- Telescope integration
local telescope_ok, telescope = pcall(require, "telescope")
if telescope_ok then
  telescope.load_extension("notify")
  
  -- Keymap to view notification history
  vim.keymap.set("n", "<leader>nh", function()
    telescope.extensions.notify.notify()
  end, { desc = "View notification history" })
end

-- Utility functions for easy notifications
_G.notify_info = function(msg)
  vim.notify(msg, vim.log.levels.INFO, { title = "Info" })
end

_G.notify_warn = function(msg)
  vim.notify(msg, vim.log.levels.WARN, { title = "Warning" })
end

_G.notify_error = function(msg)
  vim.notify(msg, vim.log.levels.ERROR, { title = "Error" })
end

-- Example: Show a welcome notification on startup
vim.defer_fn(function()
  vim.notify("Welcome to Neovim, Gabriel! 🚀", vim.log.levels.INFO, {
    title = "Neovim",
    timeout = 2000,
  })
end, 500)