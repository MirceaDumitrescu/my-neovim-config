local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- Wrap add_file to suppress error on non-file buffers
local function safe_add_file()
  local ok, err = pcall(mark.add_file)
  if not ok then
    -- Silently ignore - not a valid file
  end
end

vim.keymap.set("n", "<leader>a", safe_add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-1>", function()
  ui.nav_file(1)
end)
vim.keymap.set("n", "<C-2>", function()
  ui.nav_file(2)
end)
vim.keymap.set("n", "<C-3>", function()
  ui.nav_file(3)
end)
vim.keymap.set("n", "<C-4>", function()
  ui.nav_file(4)
end)
