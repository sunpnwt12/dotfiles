local my_augroup = vim.api.nvim_create_augroup("MyAuGroup", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = my_augroup,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "help" },
	group = my_augroup,
	callback = function()
		vim.keymap.set("n", "q", "<CMD>quit<CR>", { noremap = true, silent = true, buffer = true })
	end,
})

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(e)
		local name, kind = e.data.spec.name, e.data.kind

		-- markdown-preview
		if name == "markdown-preview" and kind == "install" then
			vim.fn["mkdp#util#install"]()

		-- nvim-treesitter
		elseif name == "nvim-treesitter" and kind == "update" then
			if not e.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})
