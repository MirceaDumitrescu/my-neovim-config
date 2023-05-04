vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('i', '<leader>q', '<Esc>:q<CR>')
vim.keymap.set('n', '<leader>Q', ':qa<CR>')
vim.keymap.set('n', '<leader>Q', ':qa<CR>')
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Paste from clipboard
vim.keymap.set("n", "<leader>p", [["+p]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")


-- Remap jk to <Esc> in insert mode
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


-- setup mapping to call :LazyGit
vim.keymap.set('n', '<leader>gg', vim.cmd.LazyGit)


-- save file
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>')

-- navigate between buffers
vim.keymap.set("n", "<leader><leader>", ":JABSOpen<CR>")
vim.keymap.set("n", "<leader>w", "<cmd>Prettier<CR>:w<CR>")

-- Terminal mapping
vim.keymap.set('n', '<leader>t', '<cmd>exe v:count1 . "ToggleTerm"<CR>', {silent = true})


-- Movement remaps
vim.keymap.set('n', 'J', '5jzz')
vim.keymap.set('n', 'K', '5kzz')
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- Split Pane Navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')


-- Remap to open a new horizontal split with tree explorer using vim.cmd.ex
vim.keymap.set('n', '<leader>E', ':30vsp<CR>:Ex<CR>')
vim.keymap.set('n', '<leader>t', ':bel 15sp<CR>:terminal<CR>i')
vim.keymap.set('n', '<leader>T', ':terminal<CR>i')
vim.keymap.set('n', '<leader>tt',':FloatermNew<CR>')
vim.keymap.set('n', '<leader>lf', ':FloatermNew lf<CR>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('t', '<leader>q', '<C-\\><C-n>:q<CR>')
vim.keymap.set('t', '<leader>H', '<C-\\><C-n>:hide<CR>')
vim.keymap.set('n', '<leader>q', ':bp|bd #<CR>')
vim.keymap.set('n', '<leader>r', ':b zsh<CR>')
vim.keymap.set('n', '[p', ':bprev<CR>')
vim.keymap.set('n', ']p', ':bnext<CR>')
vim.keymap.set('t', '[p', '<C-\\><C-n>:bprev<CR>')
vim.keymap.set('t', ']p', '<C-\\><C-n>:bnext<CR>')
                                        

-- Select the word under cursor
vim.keymap.set('n', 'sw', 'viw')
-- Copy the selected word to clipboard directly in one command
vim.keymap.set('n', 'sW', 'viw"+y')


-- split remap
-- split right and open tree
vim.keymap.set('n', '<leader>sv', ':vsp<CR>:Ex<CR>')
-- split below and open trej
vim.keymap.set('n', '<leader>sh', ':sp<CR>:Ex<CR>')
