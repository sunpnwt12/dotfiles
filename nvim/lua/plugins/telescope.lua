local opts = {
	extensions = {
		hijack_netrw = true,
	},
	pickers = {
		find_files = {
			find_command = {
				"rg",
				"--ignore",
				"--hidden",
				"--files",
			},
		},
	},
}

return {
	"nvim-telescope/telescope.nvim",
	opts = opts,
	version = "0.1.2",
	cmd = "Telescope",
	dependencies = { { "nvim-lua/plenary.nvim" } },
}
