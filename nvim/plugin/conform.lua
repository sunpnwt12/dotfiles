vim.pack.add({ "https://github.com/stevearc/conform.nvim" })
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
		markdown = { "prettierd" },
		["*"] = { "trim_whitespace", "trim_newlines" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
