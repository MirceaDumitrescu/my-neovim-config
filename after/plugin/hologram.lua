-- Hologram.nvim configuration
-- NOTE: This plugin requires Kitty or WezTerm terminal for full functionality
-- and may have limited support on macOS

local status_ok, hologram = pcall(require, "hologram")
if not status_ok then
  -- Silently fail if hologram can't load (OS compatibility issues)
  return
end

-- Safely try to setup hologram
local setup_ok = pcall(function()
  hologram.setup({
    -- Automatically display images when opening a file
    auto_display = false, -- Set to false due to macOS compatibility
  })
end)

if not setup_ok then
  -- If setup fails, create stub functions to prevent errors
  _G.hologram_available = false
  vim.notify("Hologram.nvim: Limited functionality on this system", vim.log.levels.WARN, {
    title = "Hologram",
    timeout = 2000,
  })
  return
else
  _G.hologram_available = true
end

-- Custom keymaps for image handling (only if hologram is available)
if _G.hologram_available then
  local opts = { noremap = true, silent = true }
  
  -- Toggle all images in buffer
  vim.keymap.set('n', '<leader>it', function()
    pcall(function() require("hologram").toggle_images() end)
  end, opts)
  
  -- Clear all images
  vim.keymap.set('n', '<leader>ic', function()
    pcall(function() require("hologram").clear_images() end)
  end, opts)
  
  -- Auto-display images in markdown files
  vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.md", "*.markdown"},
    callback = function()
      -- Enable image display for markdown files
      vim.defer_fn(function()
        pcall(function()
          require('hologram').enable_images()
        end)
      end, 100)
    end,
  })
  
  -- Function to view image from URL
  _G.view_image_from_url = function(url)
    -- Download image to temp file
    local temp_file = vim.fn.tempname() .. ".png"
    local cmd = string.format("curl -s -o %s %s", temp_file, url)
    
    vim.fn.system(cmd)
    
    if vim.v.shell_error == 0 then
      pcall(function()
        require('hologram').display_image(temp_file)
        vim.notify("Image loaded from URL", vim.log.levels.INFO, {
          title = "Hologram",
        })
      end)
    else
      vim.notify("Failed to load image from URL", vim.log.levels.ERROR, {
        title = "Hologram",
      })
    end
  end
  
  -- Command to view image from URL
  vim.api.nvim_create_user_command('ImageFromURL', function(opts)
    view_image_from_url(opts.args)
  end, { nargs = 1, desc = "Display image from URL" })
end

-- Display compatibility message
vim.defer_fn(function()
  if _G.hologram_available then
    local term = os.getenv("TERM_PROGRAM")
    if term == "kitty" then
      vim.notify("Image display ready (Kitty terminal)", vim.log.levels.INFO, {
        title = "Hologram",
        timeout = 1500,
      })
    elseif term == "WezTerm" then
      vim.notify("Image display ready (WezTerm)", vim.log.levels.INFO, {
        title = "Hologram",
        timeout = 1500,
      })
    else
      vim.notify("Note: Image display requires Kitty or WezTerm terminal", vim.log.levels.INFO, {
        title = "Hologram",
        timeout = 2000,
      })
    end
  end
end, 1000)