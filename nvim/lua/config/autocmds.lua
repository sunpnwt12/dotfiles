local format_augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
	group = format_augroup,
})

local handle_session_augroup = vim.api.nvim_create_augroup("HandleSessionRestore", { clear = true })
vim.api.nvim_create_autocmd("DirChanged", {
	callback = function()
		-- vim.cmd("Lazy load nvim-lspconfig")
		if #vim.lsp.get_active_clients() > 0 then
			vim.cmd("LspRestart")
		end
	end,
	group = handle_session_augroup,
})

local my_augroup = vim.api.nvim_create_augroup("MyAuGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "help" },
	callback = function()
		vim.keymap.set("n", "q", "<CMD>quit<CR>", { noremap = true, silent = true, buffer = true })
	end,
	group = my_augroup,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "rust" },
	callback = function()
		vim.keymap.set("n", "<F5>", "<CMD>RustDebuggables<CR>", { noremap = true, silent = true, buffer = true })
	end,
	group = my_augroup,
})
