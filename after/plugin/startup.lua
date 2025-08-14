local status_ok, startup = pcall(require, "startup")
if not status_ok then
  vim.notify("Startup.nvim not found!")
  return
end

-- Load our custom theme
local theme_ok, theme = pcall(require, "startup_theme")
if not theme_ok then
  vim.notify("Startup theme not found!")
  return
end

-- Setup with our custom theme
startup.setup(theme)

-- Set custom highlight groups for more vibrant colors
vim.api.nvim_create_autocmd("FileType", {
  pattern = "startup",
  callback = function()
    vim.cmd([[
      highlight StartupHeader guifg=#FF69B4 gui=bold
      highlight StartupFooter guifg=#00FFFF gui=italic
      highlight StartupBorder guifg=#FF1493
      highlight StartupFile guifg=#FFB6C1
      highlight StartupPath guifg=#87CEEB
      highlight StartupKey guifg=#FFD700 gui=bold
      highlight StartupFoldedSection guifg=#FF69B4
    ]])
  end
})