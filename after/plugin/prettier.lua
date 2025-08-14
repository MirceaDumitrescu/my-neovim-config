local status_ok, prettier = pcall(require, "prettier")
if not status_ok then
  return
end

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` for faster formatting
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
    "vue",
    "svelte",
    "prisma",
  },
  
  -- Prettier options
  ["null-ls"] = {
    condition = function()
      return prettier.config_exists({
        -- if there's a .prettierrc file, use it
        check_package_json = true,
      })
    end,
    runtime_condition = function()
      -- Only run if a config file exists
      return true
    end,
    timeout = 5000,
  },
  
  cli_options = {
    arrow_parens = "always",
    bracket_spacing = true,
    bracket_same_line = false,
    embedded_language_formatting = "auto",
    end_of_line = "lf",
    html_whitespace_sensitivity = "css",
    jsx_single_quote = false,
    print_width = 80,
    prose_wrap = "preserve",
    quote_props = "as-needed",
    semi = true,
    single_attribute_per_line = false,
    single_quote = false,
    tab_width = 2,
    trailing_comma = "es5",
    use_tabs = false,
    vue_indent_script_and_style = false,
  },
})