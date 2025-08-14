local settings = {
  -- Define sections
  section_1 = {
    type = "text",
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    title = "Header",
    margin = 5,
    content = {
      "                                                              ",
      "   ██████╗  █████╗ ██████╗ ██████╗ ██╗███████╗██╗           ",
      "  ██╔════╝ ██╔══██╗██╔══██╗██╔══██╗██║██╔════╝██║           ",
      "  ██║  ███╗███████║██████╔╝██████╔╝██║█████╗  ██║           ",
      "  ██║   ██║██╔══██║██╔══██╗██╔══██╗██║██╔══╝  ██║           ",
      "  ╚██████╔╝██║  ██║██████╔╝██║  ██║██║███████╗███████╗      ",
      "   ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝╚══════╝╚══════╝      ",
      "                                                              ",
      "  ╔════════════════════════════════════════════════════╗     ",
      "  ║          Welcome to Neovim - Ready to Code!        ║     ",
      "  ╚════════════════════════════════════════════════════╝     ",
      "                                                              ",
    },
    highlight = "Statement",
    default_color = "#FF6B9D",
    oldfiles_amount = 0,
  },
  section_2 = {
    type = "mapping",
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    title = "  Quick Actions",
    margin = 5,
    content = {
      { "  Find File", "Telescope find_files", "f" },
      { "  Recent Files", "Telescope oldfiles", "r" },
      { "  Search Text", "Telescope live_grep", "s" },
      { "  New File", "enew", "n" },
      { "  Git Status", "Git status", "g" },
      { "  File Explorer", "Ex", "e" },
      { "  Claude Code", "ClaudeCode", "c" },
      { "  LazyGit", "LazyGit", "l" },
      { "󰏔  Harpoon", "lua require('harpoon.ui').toggle_quick_menu()", "h" },
      { "  Update Plugins", "PackerUpdate", "u" },
      { "  Neovim Config", "edit ~/.config/nvim/init.lua", "v" },
      { "  Quit", "qa", "q" },
    },
    highlight = "String",
    default_color = "#7FC7D9",
    oldfiles_amount = 0,
  },
  section_3 = {
    type = "oldfiles",
    oldfiles_directory = true,
    align = "center",
    fold_section = false,
    title = "  Recent Files",
    margin = 5,
    content = {},
    highlight = "Constant",
    default_color = "#FFD93D",
    oldfiles_amount = 8,
  },
  section_4 = {
    type = "text",
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    title = "",
    margin = 5,
    content = function()
      local version = vim.version()
      local nvim_version = "v" .. version.major .. "." .. version.minor .. "." .. version.patch
      local date = os.date("%a %d %B %Y")
      local time = os.date("%H:%M")
      local plugins_count = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
      local platform = vim.fn.has("mac") == 1 and "macOS" or "Linux"
      
      return {
        "────────────────────────────────────────────────────────",
        "  " .. platform .. " |  Neovim " .. nvim_version .. " | 󰏔 " .. plugins_count .. " plugins",
        "  " .. date .. " |  " .. time,
        "────────────────────────────────────────────────────────",
        "⚡ Press any key from Quick Actions to begin",
      }
    end,
    highlight = "Number",
    default_color = "#6BCB77",
    oldfiles_amount = 0,
  },
  options = {
    mapping_keys = true,
    cursor_column = 0.5,
    empty_lines_between_mappings = true,
    disable_statuslines = true,
    paddings = {1, 2, 2, 2},
  },
  mappings = {
    execute_command = "<CR>",
    open_file = "o",
    open_file_split = "s",
    open_section = "<TAB>",
    open_help = "?",
  },
  colors = {
    background = "#1a1b26",
    folded_section = "#56b6c2",
  },
  parts = {"section_1", "section_2", "section_3", "section_4"},
}

return settings