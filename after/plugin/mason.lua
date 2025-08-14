-- Mason must be setup before mason-lspconfig
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  vim.notify("Mason not found", vim.log.levels.ERROR)
  return
end

-- Setup Mason first
mason.setup({
  ui = {
    border = "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
  registries = {
    'github:mason-org/mason-registry',
    'github:nvim-java/mason-registry',
  },
})

-- Then setup mason-lspconfig
local lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not lspconfig_status then
  vim.notify("mason-lspconfig not found", vim.log.levels.WARN)
else
  mason_lspconfig.setup({
    ensure_installed = {
      "tsserver", -- TypeScript/JavaScript
      "html", -- HTML
      "cssls", -- CSS
      "tailwindcss", -- Tailwind CSS
      "lua_ls", -- Lua
      "jsonls", -- JSON
      "eslint", -- ESLint
      "pyright", -- Python
      "rust_analyzer", -- Rust
      "gopls", -- Go
    },
    automatic_installation = true,
  })
end

-- Finally setup mason-null-ls (works with none-ls too)
local null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not null_ls_status then
  vim.notify("mason-null-ls not found", vim.log.levels.WARN)
else
  mason_null_ls.setup({
    ensure_installed = {
      "prettier", -- Prettier formatter
      "stylua", -- Lua formatter
      "eslint_d", -- ESLint daemon
      "black", -- Python formatter
      "shfmt", -- Shell formatter
    },
    automatic_installation = true,
    handlers = {}, -- Keep default handlers
  })
end

-- Keymaps
vim.keymap.set("n", "<leader>M", ":Mason<CR>", { desc = "Open Mason" })

-- Display notification when Mason installs are complete
local mason_registry_status, mason_registry = pcall(require, "mason-registry")
if mason_registry_status then
  mason_registry:on("package:install:success", function(pkg)
    vim.defer_fn(function()
      vim.notify(
        string.format("%s installed successfully", pkg.name),
        vim.log.levels.INFO,
        { title = "Mason" }
      )
    end, 500)
  end)
end