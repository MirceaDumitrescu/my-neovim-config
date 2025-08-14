-- Using none-ls (maintained fork of null-ls)
local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  -- Try the new name
  local none_ls_ok, none_ls = pcall(require, "none-ls")
  if not none_ls_ok then
    vim.notify("null-ls/none-ls not found", vim.log.levels.WARN, { title = "Formatting" })
    return
  end
  null_ls = none_ls
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

-- Create an autogroup for formatting
local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

null_ls.setup({
  debug = false,
  sources = {
    -- Formatters
    formatting.prettier.with({
      filetypes = {
        "javascript",
        "javascriptreact", 
        "typescript",
        "typescriptreact",
        "vue",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "jsonc",
        "yaml",
        "markdown",
        "graphql",
        "svelte",
      },
      extra_args = function(params)
        return params.options
          and params.options.tabSize
          and {
            "--tab-width",
            params.options.tabSize,
          }
      end,
    }),
    
    -- Python formatter
    formatting.black.with({
      extra_args = { "--line-length", "88", "--fast" },
    }),
    
    -- Lua formatter
    formatting.stylua.with({
      extra_args = { "--indent-type", "Spaces", "--indent-width", "2" },
    }),
    
    -- Shell formatter
    formatting.shfmt,
    
    -- Diagnostics (only if files exist to avoid errors)
    diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ ".eslintrc.js", ".eslintrc.json", ".eslintrc", ".eslintrc.yml", "eslint.config.js" })
      end,
    }),
    
    -- Code Actions
    code_actions.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ ".eslintrc.js", ".eslintrc.json", ".eslintrc", ".eslintrc.yml", "eslint.config.js" })
      end,
    }),
    code_actions.gitsigns,
  },
  
  -- Format on save
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ 
            bufnr = bufnr,
            timeout_ms = 5000,
            filter = function(client)
              return client.name == "null-ls" or client.name == "none-ls"
            end,
          })
        end,
      })
    end
  end,
})

-- Create formatting command
vim.api.nvim_create_user_command("Format", function()
  vim.lsp.buf.format({ 
    timeout_ms = 5000,
    filter = function(client)
      return client.name == "null-ls" or client.name == "none-ls"
    end,
  })
end, {})

-- Keymaps for formatting
vim.keymap.set("n", "<leader>fm", function()
  vim.lsp.buf.format({ 
    timeout_ms = 5000,
    filter = function(client)
      return client.name == "null-ls" or client.name == "none-ls"
    end,
  })
end, { desc = "Format file" })

-- Toggle format on save
local format_on_save = true
vim.api.nvim_create_user_command("ToggleFormatOnSave", function()
  format_on_save = not format_on_save
  if format_on_save then
    vim.notify("Format on save enabled", vim.log.levels.INFO, { title = "Formatting" })
  else
    vim.notify("Format on save disabled", vim.log.levels.WARN, { title = "Formatting" })
  end
end, {})