local keymap = vim.keymap.set

-- Save file
keymap({'n', 'i', 'v'}, "<C-S>", "<Cmd>:w!<CR>")

-- Move lines highlighted
keymap("v", "J", "<Cmd>:m '>+1<CR>gv=gv")
keymap("v", "K", "<Cmd>:m '<-2<CR>gv=gv")

-- Yank to system clipboard
keymap({"n", "v"}, "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
-- Paste from system clipboard
keymap({"n","v"}, "<leader>p", "\"+p", { desc = "Paste from system clipboard" })
keymap("n", "<leader>P", "\"+P", { desc = "Paste from system clipboard" })

-- Add Semicolon to end of line
keymap("n", "<C-;>", "A;<esc>")

-- Switch tabs
keymap("n", "<A-1>", "<Cmd>:BufferLineGoToBuffer 1<CR>", { desc = "Switch to buffer 1" })
keymap("n", "<A-2>", "<Cmd>:BufferLineGoToBuffer 2<CR>", { desc = "Switch to buffer 2" })
keymap("n", "<A-3>", "<Cmd>:BufferLineGoToBuffer 3<CR>", { desc = "Switch to buffer 3" })
keymap("n", "<A-4>", "<Cmd>:BufferLineGoToBuffer 4<CR>", { desc = "Switch to buffer 4" })
keymap("n", "<A-5>", "<Cmd>:BufferLineGoToBuffer 5<CR>", { desc = "Switch to buffer 5" })
keymap("n", "<A-6>", "<Cmd>:BufferLineGoToBuffer 6<CR>", { desc = "Switch to buffer 6" })
keymap("n", "<A-7>", "<Cmd>:BufferLineGoToBuffer 7<CR>", { desc = "Switch to buffer 7" })
keymap("n", "<A-8>", "<Cmd>:BufferLineGoToBuffer 8<CR>", { desc = "Switch to buffer 8" })
keymap("n", "<A-9>", "<Cmd>:BufferLineGoToBuffer 9<CR>", { desc = "Switch to buffer 9" })
keymap("n", "<A-c>", "<Cmd>:bdelete<CR>", { desc = "Close current buffer" })

-- Vertical movement
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- Open sidebar
keymap("n", "<leader>k", "<Cmd>:NvimTreeToggle<CR>", { desc = "Toggle Side bar" })

-- Telescope
local builtin = require('telescope.builtin')
keymap('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
keymap('n', '<leader>fg', builtin.live_grep, { desc = 'Grep files' })
keymap('n', '<leader>fb', builtin.buffers, { desc = 'List buffers' })
keymap('n', '<leader>fh', builtin.help_tags, { desc = 'List help tags' })
keymap('n', '<leader>fr', builtin.reloader, { desc = 'Reload' })

-- Terminal
keymap({'n', 'v'}, '<leader>tt', "<Cmd>:ToggleTerm direction=float<CR>", { desc = 'Open Terminal' })
keymap({'n', 't'}, '<A-i>', "<Cmd>:ToggleTerm direction=float<CR>", { desc = 'Open Terminal' })

-- Folding
keymap('n', 'zR', require('ufo').openAllFolds)
keymap('n', 'zM', require('ufo').closeAllFolds)

-- Keyracer
keymap('n', '<leader>tb', ":DuckyType<CR>", { desc = "Start typing test" })
