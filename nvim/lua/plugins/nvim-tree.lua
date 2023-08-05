local opts = {
	git = {
		enable = false,
	},
}

return {
	"nvim-tree/nvim-tree.lua",
	cmd = "NvimTreeToggle",
	opts = opts,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}
