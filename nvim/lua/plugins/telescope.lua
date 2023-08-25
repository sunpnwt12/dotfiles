local config = function()
	local telescope = require("telescope")
	telescope.setup({
		extensions = {
			hijack_netrw = true,
			zoxide = {
				prompt_title = "Zoxide",
			},
		},

		pickers = {
			find_files = {
				find_command = {
					"rg",
					"--ignore",
					"--hidden",
					"--files",
					"--glob",
					"!**/.git/*",
				},
			},
		},
	})
	telescope.load_extension("zoxide")
	telescope.load_extension("session-lens")
end

return {
	"nvim-telescope/telescope.nvim",
	config = config,
	version = "0.1.2",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
