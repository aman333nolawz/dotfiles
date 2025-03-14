local keymap = vim.keymap.set
local Snacks = require("snacks")

-- Save file
keymap({ "n", "i", "v" }, "<C-S>", "<Cmd>:w!<CR>")

-- Move lines highlighted
keymap("v", "J", "<Cmd>:m '>+1<CR>gv=gv")
keymap("v", "K", "<Cmd>:m '<-2<CR>gv=gv")

-- Yank to system clipboard
keymap({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
-- Paste from system clipboard
keymap({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
keymap("n", "<leader>P", '"+P', { desc = "Paste from system clipboard" })

-- Add Semicolon to end of line
keymap("n", "<C-;>", "A;<esc>")

-- Switch tabs
keymap("n", "<Tab>", "<Cmd>:BufferLineCycleNext<CR>", { desc = "Switch to next buffer" })
keymap("n", "<S-Tab>", "<Cmd>:BufferLineCyclePrev<CR>", { desc = "Switch to previous buffer" })
keymap("n", "<A-1>", "<Cmd>:BufferLineGoToBuffer 1<CR>", { desc = "Switch to buffer 1" })
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

-- Refactoring
keymap("n", "<leader>lrr", vim.lsp.buf.rename, { desc = "Rename variable" })
keymap("n", "<leader>lc", vim.lsp.buf.code_action, { desc = "Code actions" })

-- Diagnostics
keymap("n", "<leader>do", vim.diagnostic.open_float, { desc = "Open diagnostics" })

-- Telescope
local builtin = require("telescope.builtin")
keymap("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
keymap("n", "<leader>fg", builtin.live_grep, { desc = "Grep files" })
keymap("n", "<leader>fb", builtin.buffers, { desc = "List buffers" })
keymap("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "List Document Symbols" })
keymap("n", "<leader>fd", builtin.diagnostics, { desc = "List Diagnostics" })
keymap("n", "<leader>fh", builtin.help_tags, { desc = "List help tags" })
keymap("n", "<leader>fr", builtin.reloader, { desc = "Reload" })

-- Terminal
keymap({ "n", "v" }, "<leader>tt", Snacks.terminal.toggle, { desc = "Open Terminal" })
keymap({ "n", "t", "i" }, "<C-`>", Snacks.terminal.toggle, { desc = "Open Terminal" })

-- Compile
keymap("n", "<F5>", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })
keymap("n", "<S-F5>", "<cmd>CompilerStop<cr>" .. "<cmd>CompilerRedo<cr>", { noremap = true, silent = true })
keymap("n", "<S-F6>", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

-- Folding
keymap("n", "zR", require("ufo").openAllFolds)
keymap("n", "zM", require("ufo").closeAllFolds)
