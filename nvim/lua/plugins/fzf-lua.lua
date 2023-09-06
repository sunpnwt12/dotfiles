local config = function()
	-- for max performance
	require("fzf-lua").setup()
	require("fzf-lua").register_ui_select()

	local map = vim.keymap.set
	local defaults_opts = { noremap = true, silent = true }

	map("n", "<leader>ff", "<CMD>lua require('fzf-lua').files()<CR>", defaults_opts)
	map("n", "<leader>fk", "<CMD>lua require('fzf-lua').keymaps()<CR>", defaults_opts)
	map("n", "<leader>fb", "<CMD>lua require('fzf-lua').buffers()<CR>", defaults_opts)
	map("n", "<leader>fc", "<CMD>lua require('fzf-lua').lgrep_curbuf()<CR>", defaults_opts)
	map("n", "<leader>fg", "<CMD>lua require('fzf-lua').live_grep()<CR>", defaults_opts)
	map("n", "<leader>fr", "<CMD>lua require('fzf-lua').oldfiles()<CR>", defaults_opts)
	map("n", "<C-p>", "<CMD>lua require('fzf-lua').gitfiles()<CR>", defaults_opts)
end

return {
	"ibhagwan/fzf-lua",
	cond = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = config,
	event = "VeryLazy",
}