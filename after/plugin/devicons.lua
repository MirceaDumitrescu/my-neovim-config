local status_ok, devicons = pcall(require, "nvim-web-devicons")
if not status_ok then
  return
end

devicons.setup({
  -- Enable different highlight for each icon
  color_icons = true,
  
  -- Use default icon
  default = true,
  
  -- Enable strict selection of icons - overrides default
  strict = true,
  
  -- Override specific file type icons
  override_by_filename = {
    [".gitignore"] = {
      icon = "",
      color = "#f1502f",
      name = "Gitignore"
    },
    ["Dockerfile"] = {
      icon = "",
      color = "#458ee6",
      name = "Dockerfile"
    },
    [".env"] = {
      icon = "",
      color = "#faf743",
      name = "Env"
    },
    ["package.json"] = {
      icon = "",
      color = "#8bc348",
      name = "PackageJson"
    },
    ["package-lock.json"] = {
      icon = "",
      color = "#cb3837",
      name = "PackageLockJson"
    }
  },
  
  -- Override file extension icons
  override_by_extension = {
    ["js"] = {
      icon = "",
      color = "#f7df1e",
      name = "JavaScript"
    },
    ["ts"] = {
      icon = "",
      color = "#3178c6",
      name = "TypeScript"
    },
    ["jsx"] = {
      icon = "",
      color = "#61dafb",
      name = "JSX"
    },
    ["tsx"] = {
      icon = "",
      color = "#61dafb",
      name = "TSX"
    },
    ["vue"] = {
      icon = "󰡄",
      color = "#4fc08d",
      name = "Vue"
    },
    ["swift"] = {
      icon = "",
      color = "#fa7343",
      name = "Swift"
    },
    ["go"] = {
      icon = "",
      color = "#00add8",
      name = "Go"
    },
    ["rs"] = {
      icon = "",
      color = "#dea584",
      name = "Rust"
    },
    ["py"] = {
      icon = "",
      color = "#3776ab",
      name = "Python"
    },
    ["lua"] = {
      icon = "",
      color = "#000080",
      name = "Lua"
    },
    ["md"] = {
      icon = "",
      color = "#ffffff",
      name = "Markdown"
    },
    ["json"] = {
      icon = "",
      color = "#cbcb41",
      name = "JSON"
    },
    ["yaml"] = {
      icon = "",
      color = "#cb171e",
      name = "YAML"
    },
    ["yml"] = {
      icon = "",
      color = "#cb171e",
      name = "YAML"
    },
  },
})

-- Get all registered icons for debugging
-- local icons = devicons.get_icons()
-- for name, icon_data in pairs(icons) do
--   print(name, icon_data.icon, icon_data.color)
-- end