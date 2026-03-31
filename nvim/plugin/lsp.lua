vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
})
-- require("nvim-lspconfig").setup()
require("mason").setup({
	ui = {
		border = "rounded",
	},
})
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
		"ruff",
		"ty",
		"zls",
	},
})

vim.diagnostic.config({ virtual_text = true })
