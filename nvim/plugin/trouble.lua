vim.api.nvim_create_autocmd("LspAttach", {
	once = true,
	callback = function()
		vim.pack.add({ "https://github.com/folke/trouble.nvim" })
		require("trouble").setup()
	end,
})
