-- Setup completion
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  }),
})

-- Setup LSP attach handlers
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local bufnr = event.buf
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts) -- Changed from C-s (used by Avante)
  end,
})

-- Configure specific language servers
-- Use vim.lsp.config if available (Nvim 0.11+)
if vim.lsp.config then
  -- Configure lua_ls with vim globals
  vim.lsp.config('lua_ls', {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        }
      }
    }
  })

  -- Configure Swift LSP
  vim.lsp.config('sourcekit', {
    cmd = { 'sourcekit-lsp' },
    filetypes = { 'swift', 'objective-c', 'objective-cpp' },
  })

  -- Enable all servers installed via Mason
  -- nvim-lspconfig provides configs in lsp/ directory that vim.lsp.config auto-discovers
  vim.lsp.enable({
    'lua_ls',
    'sourcekit',
    'ts_ls',
    'html',
    'cssls',
    'tailwindcss',
    'jsonls',
    'eslint',
    'pyright',
    'rust_analyzer',
  })
end

vim.diagnostic.config({
    virtual_text = true
})

-- set color column to 0
vim.opt.colorcolumn = "0"
