local config = function()
	require("code_runner").setup({
		before_run_filetype = function()
			vim.cmd(":w")
		end,
		filetype = {
			python = "python3 -u",
			rust = "cargo run",
		},
		mode = "toggleterm",
		-- Focus on runner window(only works on toggle, term and tab mode)
		focus = true,
	})
end

return {
	"CRAG666/code_runner.nvim",
	config = config,
	cmd = "RunCode",
	dependencies = "akinsho/toggleterm.nvim",
}
