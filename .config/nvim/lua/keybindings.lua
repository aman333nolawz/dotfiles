local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end

-- Toggle side bar
map('n', '<leader>k', ':NvimTreeToggle<CR>')

-- Quit neovim
map('n', '<C-Q>', '<CMD>q<CR>')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<C-j>', '<CMD>move .+1<CR>')
map('n', '<C-k>', '<CMD>move .-2<CR>')
map('x', '<C-j>', ":move '>+1<CR>gv=gv")
map('x', '<C-k>', ":move '<-2<CR>gv=gv")

map('n', '<C-DOWN>', '<CMD>move .+1<CR>')
map('n', '<C-UP>', '<CMD>move .-2<CR>')
map('x', '<C-DOWN>', ":move '>+1<CR>gv=gv")
map('x', '<C-uP>', ":move '<-2<CR>gv=gv")

-- Moving around windows
map('n', '<A-DOWN>', ':wincmd j<CR>')
map('n', '<A-UP>', ':wincmd k<CR>')
map('n', '<A-LEFT>', ':wincmd h<CR>')
map('n', '<A-RIGHT>', ':wincmd l<CR>')

-- resizing windows
map('n', '<A-[>', ':vertical resize -5<CR>') -- Decreases
map('n', '<A-]>', ':vertical resize +5<CR>') -- Increses

-- Running code
map('n', '<C-b>', ':RunCode<CR>')
map('n', '<leader>rf', ':RunFile<CR>')
map('n', '<leader>rft', ':RunFile tab<CR>')

-- Tabs
-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferLineCyclePrev<CR>')
map('n', '<A-.>', '<Cmd>BufferLineCycleNext<CR>')
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferLineMovePrev<CR>')
map('n', '<A->>', '<Cmd>BufferLineMoveNext<CR>')
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferLineGoToBuffer 1<CR>')
map('n', '<A-2>', '<Cmd>BufferLineGoToBuffer 2<CR>')
map('n', '<A-3>', '<Cmd>BufferLineGoToBuffer 3<CR>')
map('n', '<A-4>', '<Cmd>BufferLineGoToBuffer 4<CR>')
map('n', '<A-5>', '<Cmd>BufferLineGoToBuffer 5<CR>')
map('n', '<A-6>', '<Cmd>BufferLineGoToBuffer 6<CR>')
map('n', '<A-7>', '<Cmd>BufferLineGoToBuffer 7<CR>')
map('n', '<A-8>', '<Cmd>BufferLineGoToBuffer 8<CR>')
map('n', '<A-9>', '<Cmd>BufferLineGoToBuffer 9<CR>')
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferLineTogglePin<CR>')
-- Close buffer
map('n', '<A-c>', '<Cmd>Bdelete<CR>')

-- Latex
map('n', '<C-c>', '<Cmd>!pdflatex %<CR>')
