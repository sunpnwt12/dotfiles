local opts = {
	show_current_context = true,
	-- show_current_context_start = true,
	use_treesitter = true,
	-- char = "▏",
	-- context_char = "▏",
	-- use_treesitter_scope = true,
	file_type_exclude = { "help", "oil", "lspinfo", "checkhealth" },
}

return {
	"lukas-reineke/indent-blankline.nvim",
	opts = opts,
	event = { "BufReadPre", "BufNewFile" },
}
