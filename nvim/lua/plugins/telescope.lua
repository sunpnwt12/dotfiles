local select_one_or_multi = function(prompt_bufnr)
	local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
	local multi = picker:get_multi_selection()
	if not vim.tbl_isempty(multi) then
		require("telescope.actions").close(prompt_bufnr)
		for _, j in pairs(multi) do
			if j.path ~= nil then
				vim.cmd(string.format("%s %s", "edit", j.path))
			end
		end
	else
		require("telescope.actions").select_default(prompt_bufnr)
	end
end

local config = function()
	local telescope = require("telescope")
	local actions = require("telescope.actions")

	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<ESC>"] = actions.close,
					["<CR>"] = select_one_or_multi,
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
					---- ripgrep
					-- "rg",
					-- "--ignore",
					-- "--hidden",
					-- "--files",
					-- "--glob",
					-- "!**/.git/*",

					---- fd
					"fd",
					"--type",
					"file",
					"--strip-cwd-prefix",
					"--hidden",
					"--exclude",
					".git",
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
	telescope.load_extension("undo")
end

return {
	"nvim-telescope/telescope.nvim",
	cond = false,
	config = config,
	version = "0.1.x",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"debugloop/telescope-undo.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
}
