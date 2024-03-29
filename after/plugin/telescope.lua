local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>f', builtin.git_files, {})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pf', function() 
	builtin.grep_string( { search = vim.fn.input(" Grep > ") });
end)

vim.keymap.set('n', 'sw', [[viw"+y<CR>:lua require('telescope.builtin').live_grep({ default_text = vim.fn.getreg('"') })<CR>]], { noremap = true })

