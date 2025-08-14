function ColorMyPencils()
    -- vim.cmd.colorscheme('tokyonight-storm')
    vim.cmd("colorscheme rose-pine")
    -- Keep transparency
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
ColorMyPencils()
