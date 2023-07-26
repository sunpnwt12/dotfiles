local map = vim.keymap.set
local defaults_opts = { noremap = true, silent = true }

-- command
vim.cmd([[command! Wd write|bdelete]])

-- remap
--
-- leader map
vim.g.mapleader = ","

-- new line without leaving normal mode
-- map('n', '<leader>o', 'o<Esc>', defaults_opts)
-- map('n', '<leader>O', 'O<Esc>', defaults_opts)

-- yank the rest of the line
map("n", "Y", "y$", defaults_opts)

-- Resizing window
map("n", "<C-Left>", "<cmd>vertical resize +3<CR>", defaults_opts)
map("n", "<C-Right>", "<cmd>vertical resize -3<CR>", defaults_opts)
map("n", "<C-Up>", "<cmd>resize +3<CR>", defaults_opts)
map("n", "<C-Down>", "<cmd>resize -3<CR>", defaults_opts)

-- Mason and Lazy shortcut
map("n", "<leader>ms", "<cmd>Mason<CR>", defaults_opts)
map("n", "<leader>lz", "<cmd>Lazy<CR>", defaults_opts)
map("n", "<leader>li", "<cmd>LspInfo<CR>", defaults_opts)

-- mapping copy-paste from/to copyboard
-- map('v', '<leader>y', '"+y', defaults_opts)
-- map('n', '<leader>Y', '"+yg_', defaults_opts)
-- map('n', '<leader>y', '"+y', defaults_opts)
-- map('n', '<leader>yy', '"+yy', defaults_opts)
-- map('n', '<leader>p', '"+p', defaults_opts)
-- map('v', '<leader>p', '"+p', defaults_opts)
-- map('n', '<leader>P', '"+P', defaults_opts)
-- map('v', '<leader>P', '"+P', defaults_opts)

--moving lines
-- map("n", "<a-j>", "<cmd>m .+1<cr>==", defaults_opts)
-- map("v", "<a-j>", "<cmd>m '>+1<cr>gv=gv", defaults_opts)
-- map("n", "<A-k>", "<cmd>m .-2<CR>==", defaults_opts)
-- map("v", "<A-k>", "<cmd>m '<-2<CR>gv=gv", defaults_opts)

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", defaults_opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", defaults_opts)
map("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", defaults_opts)
map("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", defaults_opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", defaults_opts)
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", defaults_opts)

-- oil
map("n", "-", require("oil").open, { desc = "Open parent directory" })

-- nvim-tree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", defaults_opts)

-- bufferline
map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", defaults_opts)
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", defaults_opts)

-- trouble
map("n", "<leader>xx", "<cmd>Trouble<CR>", defaults_opts)
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<CR>", defaults_opts)
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<CR>", defaults_opts)
map("n", "<leader>xq", "<cmd>Trouble quickfix<CR>", defaults_opts)
map("n", "gR", "<cmd>Trouble lsp_references<CR>", defaults_opts)

-- DAP
-- map("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<CR>", defaults_opts)
map("n", "<F5>", "<cmd>lua require('dap').continue()<CR>", defaults_opts)
map("n", "<F6>", "<cmd>lua require'dap'.step_over()<CR>", defaults_opts)
map("n", "<F7>", "<cmd>lua require'dap'.step_into()<CR>", defaults_opts)
map("n", "<F8>", "<cmd>lua require'dap'.step_out()<CR>", defaults_opts)
map("n", "<S-F5>", "<cmd>lua require('dap').restart()<CR>", defaults_opts)
map("n", "<C-S-F5>", "<cmd>lua require('dap').terminate()<CR>", defaults_opts)
map("n", "<leader>b", "<cmd>lua require('dap').toggle_breakpoint()<CR>", defaults_opts)
map(
	"n",
	"<leader>B",
	"<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	defaults_opts
)
map(
	"n",
	"<leader>lp",
	"<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point messages: '))<CR>",
	defaults_opts
)
map("n", "<leader>dr", "<cmd>lua require('dap').relp.open()<CR>", defaults_opts)

-- Navigator.nvim with tmux
map({ "n", "t" }, "<A-h>", "<cmd>lua require('Navigator').left()<CR>", defaults_opts)
map({ "n", "t" }, "<A-l>", "<cmd>lua require('Navigator').right()<CR>", defaults_opts)
map({ "n", "t" }, "<A-k>", "<cmd>lua require('Navigator').up()<CR>", defaults_opts)
map({ "n", "t" }, "<A-j>", "<cmd>lua require('Navigator').down()<CR>", defaults_opts)
map({ "n", "t" }, "<A-p>", "<cmd>lua require('Navigator').previous()<CR>", defaults_opts)
