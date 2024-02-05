function ColorMyPencils()
    -- vim.cmd.colorscheme('tokionight')
    vim.cmd("colorscheme tokyonight-storm")
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormnordalFloat", { bg = "none" })
end
ColorMyPencils()
