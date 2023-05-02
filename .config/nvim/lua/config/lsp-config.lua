require('mason').setup({
    ui = {
        icons = {
            package_pending = "➜",
            package_installed = "✓",
            package_uninstalled = "✗"
        }
    }
})

require('mason-lspconfig').setup()

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- language setup
--
local lspconfig = require('lspconfig')
local servers = { 'pyright', 'jdtls', 'lua_ls', 'rust_analyzer', 'tsserver', 'svelte', 'tailwindcss' }

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
    }
end
