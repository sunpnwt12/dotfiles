local format_augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
    group = format_augroup,
})

local my_augroup = vim.api.nvim_create_augroup("MyAuGroup", { clear = true })

-- vim.api.nvim_create_autocmd({ "User" }, {
-- 	pattern = "SessionLoadPost",
-- 	callback = function()
-- 		if #vim.lsp.get_active_clients() > 0 then
-- 			vim.cmd("LspRestart")
-- 		end
-- 	end,
-- })

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
