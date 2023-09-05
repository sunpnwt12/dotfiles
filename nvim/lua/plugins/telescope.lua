local config = function()
	local telescope = require("telescope")
	local actions = require("telescope.actions")
	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<ESC>"] = actions.close,
				},
			},
		},
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
			buffers = {
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
	cond = true,
	config = config,
	version = "0.1.2",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
