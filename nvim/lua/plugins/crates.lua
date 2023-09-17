local config = function()
	require("crates").setup({
		null_ls = {
			enabled = true,
			name = "crates.nvim",
		},
	})
	vim.api.nvim_create_autocmd("BufRead", {
		group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
		pattern = "Cargo.toml",
		callback = function()
			require("cmp").setup.buffer({ sources = { { name = "crates" } } })
		end,
	})
	local function show_documentation()
		local filetype = vim.bo.filetype
		if vim.tbl_contains({ "vim", "help" }, filetype) then
			vim.cmd("h " .. vim.fn.expand("<cword>"))
		elseif vim.tbl_contains({ "man" }, filetype) then
			vim.cmd("Man " .. vim.fn.expand("<cword>"))
		elseif vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
			require("crates").show_popup()
		else
			vim.lsp.buf.hover()
		end
	end

	vim.keymap.set("n", "K", show_documentation, { silent = true })
end

return {
	"Saecki/crates.nvim",
	tag = "v0.3.0",
	config = config,
	event = "BufRead Cargo.toml",
	dependencies = "nvim-lua/plenary.nvim",
}
