local map = vim.keymap.set
local defaults_opts = { noremap = true, silent = true }

-- command
vim.cmd [[command! Wd write|bdelete]]

-- remap
--
-- new line without leaving normal mode
map('n', '<leader>o', 'o<Esc>', defaults_opts)
map('n', '<leader>O', 'O<Esc>', defaults_opts)

-- yank the rest of the line
map('n', 'Y', 'y$', defaults_opts)

--moving lines
map('n', '<a-j>', ':m .+1<cr>==', defaults_opts)
map('v', '<a-j>', ':m \'>+1<cr>gv=gv', defaults_opts)
map('n', '<A-k>', ':m .-2<CR>==', defaults_opts)
map('v', '<A-k>', ':m \'<-2<CR>gv=gv', defaults_opts)

-- telescope
map('n', '<leader>ff', ':Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>', defaults_opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', defaults_opts)

-- nvim-tree
map('n', '<leader>e', ':NvimTreeToggle<CR>', defaults_opts)

-- bufferline
map('n', '<S-l>', ':BufferLineCycleNext<CR>', defaults_opts)
map('n', '<S-h>', ':BufferLineCyclePrev<CR>', defaults_opts)

-- trouble
map("n", "<leader>xx", ":Trouble<CR>", defaults_opts)
map("n", "<leader>xw", ":Trouble workspace_diagnostics<CR>", defaults_opts)
map("n", "<leader>xd", ":Trouble document_diagnostics<CR>", defaults_opts)
map("n", "<leader>xq", ":Trouble quickfix<CR>", defaults_opts)
map("n", "gR", ":Trouble lsp_references<CR>", defaults_opts)
