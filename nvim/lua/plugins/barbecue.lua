local opts = {
	theme = "catppuccin-mocha",
	exclude_filetypes = { "netrw", "toggleterm", "oil", "NvimTree" },
}

return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	event = "LspAttach",
	opts = opts,
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
}
