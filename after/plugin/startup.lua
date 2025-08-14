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
      highlight StartupHeader guifg=#FF6B9D gui=bold
      highlight StartupFooter guifg=#6BCB77 gui=italic
      highlight StartupBorder guifg=#C66FBC
      highlight StartupFile guifg=#FFB4B4
      highlight StartupPath guifg=#7FC7D9
      highlight StartupKey guifg=#FFD93D gui=bold
      highlight StartupFoldedSection guifg=#56b6c2
    ]])
  end
})