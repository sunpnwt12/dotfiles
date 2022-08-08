local map = vim.keymap.set
local opts = {noremap = true, silent = true}

-- telescope
map('n', '<leader>f', ':Telescope find_files<CR>', opts)
map('n', '<leader>h', ':Telescope find_files hidden=true<CR>', opts)
map('n', '<leader>b', ':Telescope buffers<CR>', opts)

-- nvim-tree
map('n', '<leader>t', ':NvimTreeToggle<CR>', opts)

-- bufferline
map('n', '<S-l>', ':BufferLineCycleNext<CR>', opts)
map('n', '<S-h>', ':BufferLineCyclePrev<CR>', opts)

-- LSP Config
map('n', 'gd', 'vim.lsp.buf.definition()<CR>', opts)
map('n', 'gD', 'vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gr', 'vim.lsp.buf.references()<CR>', opts)
map('n', 'gi', 'vim.lsp.buf.implemention()<CR>', opts)
map('n', 'K', 'vim.lsp.buf.hover()<CR>', opts)
map('n', '<C-k>', 'vim.lsp.buf.signature_help()<CR>', opts)
map('n', '<C-n>', 'vim.lsp.diagnostic.goto_prev()<CR>', opts)
map('n', '<C-p>', 'vim.lsp.diagnostic.goto_next()<CR>', opts)
