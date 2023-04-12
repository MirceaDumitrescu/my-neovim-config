
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

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- setup mapping to call :LazyGit
vim.keymap.set('n', '<leader>gg', vim.cmd.LazyGit)


-- save file
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>')
vim.keymap.set('n', '<leader>q', vim.cmd.q)


-- navigate between tabs
vim.keymap.set("n", "<leader>h", "<cmd>tabprevious<CR>")
vim.keymap.set("n", "<leader>l", "<cmd>tabnext<CR>")
vim.keymap.set("n", "<leader>1", "<cmd>tabfirst<CR>")
vim.keymap.set("n", "<leader>2", "<cmd>tablast<CR>")


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

-- Split remaps to open new split in the same directory
vim.keymap.set('n', '<leader>h', ':vsp<CR>:cd %:p:h<CR>:pwd<CR>')
vim.keymap.set('n', '<leader>v', ':sp<CR>:cd %:p:h<CR>:pwd<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<leader>Q', ':qa<CR>')
-- Remap to open a new horizontal split with tree explorer using vim.cmd.ex
vim.keymap.set('n', '<leader>E', ':30vsp<CR>:Ex<CR>')
vim.keymap.set('n', '<leader>t', ':30sp<CR>:terminal<CR>i')
vim.keymap.set('n', '<leader>T', ':terminal<CR>i')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('t', '<leader>q', '<C-\\><C-n>:q<CR>')
vim.keymap.set('t', '<leader>H', '<C-\\><C-n>:hide<CR>:q<CR>')
