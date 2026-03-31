vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter", verion = "main" } })
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

vim.api.nvim_create_user_command("TSStart", function()
	vim.treesitter.start()
end, {})
