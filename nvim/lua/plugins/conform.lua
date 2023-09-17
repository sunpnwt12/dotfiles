local config = function()
	local bin_path = vim.fn.stdpath("data") .. "/mason/bin/"
	-- markdown
	local markdownlint_bin = bin_path .. "markdownlint"

	require("conform").setup({
		format_on_save = {
			lsp_fallback = true,
			timeout_ms = 500,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			python = { "black" },
			markdown = { "markdownlint" },
			["*"] = { "trim_whitespace", "trim_newlines" },
		},
		formatters = {
			markdownlint = {
				command = markdownlint_bin,
				args = { "--fix", "$FILENAME" },
			},
		},
	})
end

-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   callback = function()
--     require("conform").format()
--   end,
-- })

return {
	"stevearc/conform.nvim",
	config = config,
	enabled = false, -- enable this when null-ls is eventually broke
	event = "LspAttach",
}