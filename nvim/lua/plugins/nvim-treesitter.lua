vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		vim.treesitter.start()
	end,
})
return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	branch = "main",
}
