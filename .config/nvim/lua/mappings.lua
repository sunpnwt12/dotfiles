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
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', defaults_opts)
map('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>', defaults_opts)

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

-- null-ls
map("n", "<leader>ln", "<cmd>NullLsInfo<CR>", defaults_opts)
map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting_sync(nil, 10000)<CR>", defaults_opts)

-- lspsaga
-- use <C-t> to jump back
map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", defaults_opts)
map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", defaults_opts)
map("n", "gr", "<cmd>Lspsaga rename<CR>", defaults_opts)
map("n", "gd", "<cmd>Lspsaga peek_definition<CR>", defaults_opts)
-- Show line diagnostics
map("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", defaults_opts)
-- Show cursor diagnostic
map("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", defaults_opts)
-- Diagnsotic jump can use `<c-o>` to jump back
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", defaults_opts)
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", defaults_opts)
-- Only jump to error
map("n", "[E", function()
    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, defaults_opts)
map("n", "]E", function()
    require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, defaults_opts)
-- Outline
map("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", defaults_opts)
-- Hover Doc
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", defaults_opts)
-- Float terminal
map("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", defaults_opts)
-- if you want pass somc cli command into terminal you can do like this
-- open lazygit in lspsaga float terminal
-- map("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>", defaults_opts)
-- close floaterm
map("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], defaults_opts)
