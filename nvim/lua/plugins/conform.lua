local config = function()
	require("conform").setup({
		format_on_save = {
			lsp_fallback = true,
			timeout_ms = 500,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			toml = { "prettierd" },
			yaml = { "prettierd" },
			json = { "prettierd" },
			python = { "ruff_format" },
			-- markdown = { "markdownlint" },
			["*"] = { "trim_whitespace", "trim_newlines" },
		},
	})
end

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	callback = function()
		require("conform").format()
	end,
})

return {
	"stevearc/conform.nvim",
	config = config,
	event = "LspAttach",
}
