local config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    -- local code_actions = null_ls.builtins.code_actions

    null_ls.setup({
        sources = {
            -- lua
            formatting.stylua,

            -- python
            -- formatting.black,
            -- formatting.ruff.with({
            -- 	args = { "format", "--stdin-filename", "$FILENAME" },
            -- }),
            -- diagnostics.ruff,

            -- ts/js
            -- formatting.eslint_d,
            -- formatting.prettierd.with({
            --     extra_filetypes = { "toml", "svelte" },
            -- }),
            -- diagnostics.eslint_d,
            -- code_actions.eslint_d,

            -- markdown
            formatting.markdownlint,
            diagnostics.markdownlint,
        },
    })
end

return {
    "nvimtools/none-ls.nvim",
    config = config,
    event = "LspAttach",
    cond = false,
}
