local status_ok, nvim_highlight_colors = pcall(require, "nvim-highlight-colors")
if not status_ok then
  return
end

nvim_highlight_colors.setup({
  ---Render style
  ---@usage 'background'|'foreground'|'virtual'
  render = 'background',
  
  ---Set virtual symbol (requires render to be set to 'virtual')
  virtual_symbol = '■',
  
  ---Highlight named colors, e.g. 'green'
  enable_named_colors = true,
  
  ---Highlight tailwind colors, e.g. 'bg-blue-500'
  enable_tailwind = true,
  
  ---Set custom colors
  ---Label must be properly escaped with '%' to adhere to `string.gmatch`
  --- :help string.gmatch
  custom_colors = {
    { label = '%-%-theme%-primary%-color', color = '#0f1419' },
    { label = '%-%-theme%-secondary%-color', color = '#5c6370' },
  },
  
  -- Exclude filetypes
  exclude_filetypes = {},
  
  -- Exclude buftypes
  exclude_buftypes = {
    'nofile',
    'terminal',
    'quickfix',
    'help',
  }
})

-- Turn it on by default (as per your current config)
nvim_highlight_colors.turnOn()