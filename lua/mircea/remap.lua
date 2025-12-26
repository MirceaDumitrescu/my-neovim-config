-- ignore vim not globally defined

-- Set leader key FIRST before any keymaps that use it
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('i', '<leader>q', '<Esc>:q<CR>')
vim.keymap.set('n', '<leader>Q', ':qa<CR>')
vim.keymap.set('n', '<leader>Q', ':qa<CR>')
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Move to next buffer window tab using :BufferNext
vim.keymap.set("n", "<S-l>", "<cmd>BufferNext<CR>")
vim.keymap.set("n", "<S-h>", "<cmd>BufferPrevious<CR>")

-- Move the buffer position
vim.keymap.set("n", "<leader>ml", "<cmd>BufferMoveNext<CR>")
vim.keymap.set("n", "<leader>mh", "<cmd>BufferMovePrevious<CR>")
vim.keymap.set('n', '[p', ':bprev<CR>')
vim.keymap.set('n', ']p', ':bnext<CR>')
vim.keymap.set('t', '[p', '<C-\\><C-n>:bprev<CR>')
vim.keymap.set('t', ']p', '<C-\\><C-n>:bnext<CR>')

-- Go to buffer in position 
vim.keymap.set("n", "<leader>1", "<cmd>BufferGoto 1<CR>")
vim.keymap.set("n", "<leader>2", "<cmd>BufferGoto 2<CR>")
vim.keymap.set("n", "<leader>3", "<cmd>BufferGoto 3<CR>")
vim.keymap.set("n", "<leader>4", "<cmd>BufferGoto 4<CR>")
vim.keymap.set("n", "<leader>5", "<cmd>BufferGoto 5<CR>")
vim.keymap.set("n", "<leader>6", "<cmd>BufferGoto 6<CR>")

-- Close  buffer
vim.keymap.set("n", "<leader>bd", "<cmd>BufferClose<CR>")

-- Pin buffer
vim.keymap.set("n", "<leader>bp", "<cmd>BufferPin<CR>")

vim.keymap.set("n", "<leader>bw", "<cmd>BufferWipeout<CR>")
vim.keymap.set("n", "<leader>ba", "<cmd>BufferCloseAllButCurrent<CR>")
vim.keymap.set("n", "<leader>bb", "<cmd>BufferCloseAllButVisible<CR>")
vim.keymap.set("n", "<leader>bp", "<cmd>BufferCloseAllButPinned<CR>")
vim.keymap.set("n", "<leader>bc", "<cmd>BufferCloseAllButCurrentOrPinned<CR>")
vim.keymap.set("n", "<leader>bl", "<cmd>BufferCloseBuffersLeft<CR>")
vim.keymap.set("n", "<leader>br", "<cmd>BufferCloseBuffersRight<CR>")

-- vim.keymap.set("n", "<C-l>", "<C-w>l") -- Disabled for tmux-navigator
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

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz") -- Disabled for tmux-navigator
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz") -- Disabled for tmux-navigator
-- Use leader versions instead for quickfix navigation
vim.keymap.set("n", "<leader>cn", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>cp", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


-- setup mapping to call :LazyGit
vim.keymap.set('n', '<leader>gg', vim.cmd.LazyGit)


-- save file
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>')

-- navigate between buffers
vim.keymap.set("n", "<leader>w", "<cmd>Prettier<CR>:w<CR>")

-- Terminal mapping
vim.keymap.set('n', '<leader>t', '<cmd>exe v:count1 . "ToggleTerm"<CR>', {silent = true})


-- Movement remaps
vim.keymap.set('n', 'J', '5jzz')
vim.keymap.set('n', 'K', '5kzz')
-- H and L now used for buffer navigation (Shift+H/L)
-- Use ^ and $ directly for start/end of line
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- Split Pane Navigation - Disabled for tmux-navigator
-- These are now handled by vim-tmux-navigator plugin for seamless tmux/nvim navigation
-- vim.keymap.set('n', '<C-h>', '<C-w>h')
-- vim.keymap.set('n', '<C-j>', '<C-w>j')
-- vim.keymap.set('n', '<C-k>', '<C-w>k')
-- vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Split pane navigation when in insert mode - Disabled for tmux-navigator
-- vim.keymap.set('i', '<C-h>', '<Esc><C-w>h')
-- vim.keymap.set('i', '<C-j>', '<Esc><C-w>j')
-- vim.keymap.set('i', '<C-k>', '<Esc><C-w>k')
-- vim.keymap.set('i', '<C-l>', '<Esc><C-w>l')

-- Remap to open a new horizontal split with tree explorer using vim.cmd.ex
vim.keymap.set('n', '<leader>E', ':30vsp<CR>:Ex<CR>')
vim.keymap.set('n', '<leader>ter', ':bel 15sp<CR>:terminal<CR>i')
vim.keymap.set('n', '<leader>T', ':terminal<CR>i')
vim.keymap.set('n', '<leader>tt',':FloatermNew<CR>')
vim.keymap.set('n', '<leader>lf', ':FloatermNew lf<CR>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('t', '<leader>q', '<C-\\><C-n>:q<CR>')
vim.keymap.set('t', '<leader>H', '<C-\\><C-n>:hide<CR>')
vim.keymap.set('n', '<leader>q', ':bp|bd #<CR>')
vim.keymap.set('n', '<leader>Q', ':quit<CR>')
vim.keymap.set('n', '<leader>r', ':b zsh<CR>')

-- split right and open tree
vim.keymap.set('n', '<leader>sv', ':vsp<CR>:Ex<CR>')
-- split below and open trej
vim.keymap.set('n', '<leader>sh', ':sp<CR>:Ex<CR>')


-- Specific JTI remaps
vim.keymap.set('n', '<leader>tb', ':bel 15sp<CR>:terminal<CR>i<CR>mvn clean install -Pdeploy,all,author<CR>')
vim.keymap.set('n', '<leader>ts', ':30vsp<CR>:terminal<CR>i<CR>npm run serve<CR>')
vim.keymap.set('n', '<leader>tw', ':30vsp<CR>:terminal<CR>i<CR>npm run watch<CR>')
vim.keymap.set('n', '<leader>fb', ':FloatermNew<CR>mvn clean install -Pdeploy,all,author<CR>')


-- ChatGPT.nvim remaps
vim.keymap.set('n', '<leader>cc', ':ChatGPT<CR>')
vim.keymap.set('n', '<leader>ce', ':ChatGPTEditWithInstructions<CR>')
vim.keymap.set('n', '<leader>cm', ':ChatGPTCompleteCode<CR>')
vim.keymap.set('n', '<leader>co', ':ChatGPTRun optimize_code<CR>')
vim.keymap.set('n', '<leader>cf', ':ChatGPTRun fix_bugs<CR>')
vim.keymap.set('n', '<leader>cx', ':ChatGPTRun explain_code<CR>')


-- DiffView remaps
vim.keymap.set('n', '<leader>dc', ':DiffviewOpen<CR>')
vim.keymap.set('n', '<leader>do', ':DiffviewOpen origin/master<CR>')
vim.keymap.set('n', '<leader>dq', ':DiffviewClose<CR>')
vim.keymap.set('n', '<leader>dh', ':DiffviewFileHistory<CR>')

-- Select all (using <leader>sa to avoid conflict with Avante/Harpoon)
vim.keymap.set('n', '<leader>sa', 'gg<S-v>G')

-- Dashboard keymaps (matching the dashboard shortcuts)
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fr', ':Telescope oldfiles<CR>')
vim.keymap.set('n', '<leader>fw', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fn', ':enew<CR>')
vim.keymap.set('n', '<leader>gs', ':Git status<CR>')
vim.keymap.set('n', '<leader>cc', ':ClaudeCode<CR>')
vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>')
vim.keymap.set('n', '<leader>pu', ':PackerUpdate<CR>')
vim.keymap.set('n', '<leader>vc', ':edit ~/.config/nvim/init.lua<CR>')

-- Quick access to startup screen
vim.keymap.set('n', '<leader>db', ':Startup display<CR>')

-- Hologram image viewing
vim.keymap.set('n', '<leader>iv', ':lua require("hologram").view_image()<CR>', { desc = "View image" })
vim.keymap.set('n', '<leader>it', ':lua require("hologram").toggle_images()<CR>', { desc = "Toggle images" })
vim.keymap.set('n', '<leader>ic', ':lua require("hologram").clear_images()<CR>', { desc = "Clear images" })

-- Formatting
vim.keymap.set('n', '<leader>fm', ':Format<CR>', { desc = "Format file" })
vim.keymap.set('n', '<leader>ft', ':ToggleFormatOnSave<CR>', { desc = "Toggle format on save" })
