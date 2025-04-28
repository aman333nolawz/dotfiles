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
keymap('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to declaration" })
keymap('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
keymap('n', 'gr', vim.lsp.buf.references, { desc = "References" })
keymap('n', 'gs', vim.lsp.buf.signature_help, { desc = "Signature help" })
keymap('n', 'gi', vim.lsp.buf.implementation, { desc = "Implementation" })
keymap('n', 'gt', vim.lsp.buf.type_definition, { desc = "Type definition" })
keymap('n', '<leader>ls', vim.lsp.buf.document_symbol, { desc = "Document symbols" })
keymap('n', '<leader>lS', vim.lsp.buf.workspace_symbol, { desc = "Workspace symbols" })
keymap('n', '<leader>lh', vim.lsp.buf.hover, { desc = "Hover" })
keymap('n', '<leader>li', vim.lsp.buf.incoming_calls, { desc = "Incoming calls" })
keymap('n', '<leader>lo', vim.lsp.buf.outgoing_calls, { desc = "Outgoing calls" })

-- Diagnostics
keymap("n", "<leader>do", vim.diagnostic.open_float, { desc = "Open diagnostics" })

-- Telescope
local builtin = require("telescope.builtin")
keymap("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
keymap("n", "<leader>fg", builtin.live_grep, { desc = "Grep files" })
keymap("n", "<leader>fb", builtin.buffers, { desc = "List buffers" })
keymap("n", "<leader>fd", builtin.diagnostics, { desc = "List Diagnostics" })
keymap("n", "<leader>fh", builtin.help_tags, { desc = "List help tags" })
keymap("n", "<leader>fr", builtin.reloader, { desc = "Reload" })
keymap("n", "<leader>fld", builtin.lsp_definitions, { desc = "List Definitions" })
keymap("n", "<leader>flr", builtin.lsp_references, { desc = "List References" })
keymap("n", "<leader>fli", builtin.lsp_implementations, { desc = "List Implementations" })
keymap("n", "<leader>flt", builtin.lsp_type_definitions, { desc = "List Type Definitions" })
keymap("n", "<leader>fls", builtin.lsp_document_symbols, { desc = "List Document Symbols" })
keymap("n", "<leader>flS", builtin.lsp_workspace_symbols, { desc = "List Document Symbols" })
keymap("n", "<leader>flo", builtin.lsp_outgoing_calls, { desc = "List Outgoing Calls" })
keymap("n", "<leader>fli", builtin.lsp_incoming_calls, { desc = "List Incoming Calls" })

-- Terminal
-- keymap({ "n", "v" }, "<leader>tt", Snacks.terminal.toggle, { desc = "Open Terminal" })
keymap({ "n", "t", "i" }, "<C-`>", Snacks.terminal.toggle, { desc = "Open Terminal" })

-- Compile
keymap("n", "<F5>", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })
keymap("n", "<S-F5>", "<cmd>CompilerStop<cr>" .. "<cmd>CompilerRedo<cr>", { noremap = true, silent = true })
keymap("n", "<S-F6>", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

-- Folding
keymap("n", "zR", require("ufo").openAllFolds)
keymap("n", "zM", require("ufo").closeAllFolds)
