local config = function()
    require("lint").linters_by_ft = {
        python = { "ruff" },
        markdown = { "marklint" },
    }
end

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--     callback = function()
--         require("lint").try_lint()
--     end,
-- })

return {
    "mfussenegger/nvim-lint",
    config = config,
    enabled = true, -- enable this when null-ls is eventually broke
    event = "LspAttach",
}
