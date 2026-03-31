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

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "DiffviewFiles", "DiffviewFileHistory" },
-- 	group = my_augroup,
-- 	callback = function()
-- 		vim.keymap.set("n", "q", "<CMD>tabclose<CR>", { noremap = true, silent = true, buffer = true })
-- 	end,
-- })

vim.api.nvim_create_autocmd("User", {
	pattern = "NeogitStatusRefreshed",
	group = my_augroup,
	callback = function()
		vim.cmd("checktime")
	end,
})

vim.api.nvim_create_user_command("BD", function(n)
	Snacks.bufdelete(n)
end, {})

vim.api.nvim_create_user_command("TSStart", function()
	vim.treesitter.start()
end, {})

vim.diagnostic.config({ virtual_text = true })
