local config = function()
    require("lint").linters_by_ft = {
        python = { "ruff" },
        javascript = { "eslint_d" },
        markdown = { "marklint" },
    }
end

-- vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
--   callback = function()
--     require("lint").try_lint()
--   end,
-- })

return {
    "mfussenegger/nvim-lint",
    config = config,
    enabled = false, -- enable this when null-ls is eventually broke
    event = "LspAttach",
}
