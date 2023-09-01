local config = function()
	local telescope = require("telescope")
	telescope.setup({
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
			["ui-select"] = {
				require("telescope.themes").get_dropdown({
					-- even more opts
				}),
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
			current_buffer_fuzzy_find = {
				theme = "dropdown",
				previewer = false,
			},
		},
	})
	telescope.load_extension("fzf")
	telescope.load_extension("ui-select")
end

return {
	"nvim-telescope/telescope.nvim",
	config = config,
	version = "0.1.2",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
