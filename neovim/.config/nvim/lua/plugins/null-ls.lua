local config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions

    null_ls.setup({
        sources = {
            -- lua
            formatting.stylua,

            -- python
            formatting.ruff,
            diagnostics.ruff,

            -- rust
            -- formatting.rustfmt,

            -- ts/js
            formatting.eslint_d,
            diagnostics.eslint_d,
            code_actions.eslint_d,

            -- markdown
            formatting.markdownlint,
            diagnostics.markdownlint,

            -- latex
            formatting.latexindent,
        },
    })
end

return {
    "jose-elias-alvarez/null-ls.nvim",
    config = config,
    event = "BufReadPre",
}
