local map = vim.keymap.set
local opts = {noremap = true, silent = true}

map('n', '<leader>o', 'o<Esc>', opts)
map('n', '<leader>O', 'O<Esc>', opts)

-- telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)

-- nvim-tree
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- bufferline
map('n', '<S-l>', ':BufferLineCycleNext<CR>', opts)
map('n', '<S-h>', ':BufferLineCyclePrev<CR>', opts)
