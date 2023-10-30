local opts = {
	theme = "auto",
	exclude_filetypes = { "netrw", "toggleterm", "oil", "NvimTree" },
}

return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	enabled = false,
	event = "LspAttach",
	opts = opts,
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
}
