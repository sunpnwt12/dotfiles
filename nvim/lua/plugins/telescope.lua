local config = function()
	local telescope = require("telescope")
	telescope.setup({
		extensions = {
			hijack_netrw = true,
			zoxide = {
				prompt_title = "Zoxide",
			},
			undo = {
				use_delta = true,
				use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
				side_by_side = false,
				diff_context_lines = vim.o.scrolloff,
				entry_format = "state #$ID, $STAT, $TIME",
				time_format = "",
				mappings = {
					i = {
						-- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
						-- you want to replicate these defaults and use the following actions. This means
						-- installing as a dependency of telescope in it's `requirements` and loading this
						-- extension from there instead of having the separate plugin definition as outlined
						-- above.
						["<cr>"] = require("telescope-undo.actions").yank_additions,
						["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
						["<C-cr>"] = require("telescope-undo.actions").restore,
					},
				},
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
	telescope.load_extension("undo")
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
