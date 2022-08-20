local map = vim.keymap.set
local opts = {noremap = true, silent = true}

-- command
vim.cmd [[command! Wd write|bdelete]]

-- remap
map('n', '<leader>o', 'o<Esc>', opts)
map('n', '<leader>O', 'O<Esc>', opts)
map('n', 'Y', 'y$', opts)

--moving lines
map('n', '<A-j>', ':m .+1<CR>==', opts)
map('n', '<A-k>', ':m .-2<CR>==', opts)
map('v', '<A-j>', ':m \'>+1<CR>gv=gv', opts)
map('v', '<A-k>', ':m \'<-2<CR>gv=gv', opts)
-- telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)

-- nvim-tree
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- bufferline
map('n', '<S-l>', ':BufferLineCycleNext<CR>', opts)
map('n', '<S-h>', ':BufferLineCyclePrev<CR>', opts)

-- trouble
map("n", "<leader>xx", ":Trouble<CR>", opts)
map("n", "<leader>xw", ":Trouble workspace_diagnostics<CR>", opts)
map("n", "<leader>xd", ":Trouble document_diagnostics<CR>", opts)
map("n", "<leader>xq", ":Trouble quickfix<CR>", opts)
map("n", "gR", ":Trouble lsp_references<CR>", opts)
