local opts = {
	integrations = {
		diffview = true,
	},
}

return {
	"NeogitOrg/neogit",
	opts = opts,
	cmd = "Neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"nvim-telescope/telescope.nvim", -- optional
		"sindrets/diffview.nvim", -- optional
	},
}
