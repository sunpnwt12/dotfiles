return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		indent = {
			priority = 1,
			enabled = true, -- enable indent guides
			char = "│",
			only_scope = false, -- only show indent guides of the scope
			only_current = false, -- only show indent guides in the current window
			hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides
			animate = {
				-- enabled = vim.fn.has("nvim-0.10") == 1,
				enabled = false,
			},
		},
	},
}
