return {
	"rmagatti/session-lens",
	config = true,
	cmd = { "SearchSession", "SessionSave", "SessionRestore" },
	dependencies = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
}
