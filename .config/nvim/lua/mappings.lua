local map = vim.keymap.set
local defaults_opts = { noremap = true, silent = true }

-- command
vim.cmd [[command! Wd write|bdelete]]

-- remap
--
-- leader map
vim.g.mapleader = ","

-- new line without leaving normal mode
-- map('n', '<leader>o', 'o<Esc>', defaults_opts)
-- map('n', '<leader>O', 'O<Esc>', defaults_opts)

-- Mason and Lazy shortcut
map('n', '<leader>ms', '<cmd>Mason<CR>', defaults_opts)
map('n', '<leader>lz', '<cmd>Lazy<CR>', defaults_opts)

-- yank the rest of the line
map('n', 'Y', 'y$', defaults_opts)

-- mapping copy-paste from/to copyboard
map('v', '<leader>y', '"+y', defaults_opts)
map('n', '<leader>Y', '"+yg_', defaults_opts)
map('n', '<leader>y', '"+y', defaults_opts)
map('n', '<leader>yy', '"+yy', defaults_opts)

map('n', '<leader>p', '"+p', defaults_opts)
map('v', '<leader>p', '"+p', defaults_opts)
map('n', '<leader>P', '"+P', defaults_opts)
map('v', '<leader>P', '"+P', defaults_opts)

--moving lines
map('n', '<a-j>', '<cmd>m .+1<cr>==', defaults_opts)
map('v', '<a-j>', '<cmd>m \'>+1<cr>gv=gv', defaults_opts)
map('n', '<A-k>', '<cmd>m .-2<CR>==', defaults_opts)
map('v', '<A-k>', '<cmd>m \'<-2<CR>gv=gv', defaults_opts)

-- telescope
map('n', '<leader>ff', '<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>', defaults_opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', defaults_opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', defaults_opts)
map('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>', defaults_opts)
map('n', '<C-p>', '<cmd>Telescope git_files<CR>', defaults_opts)

-- oil
map("n", "-", require("oil").open, { desc = "Open parent directory" })

-- nvim-tree
map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', defaults_opts)

-- bufferline
map('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', defaults_opts)
map('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', defaults_opts)

-- trouble
map("n", "<leader>xx", "<cmd>Trouble<CR>", defaults_opts)
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<CR>", defaults_opts)
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<CR>", defaults_opts)
map("n", "<leader>xq", "<cmd>Trouble quickfix<CR>", defaults_opts)
map("n", "gR", "<cmd>Trouble lsp_references<CR>", defaults_opts)

