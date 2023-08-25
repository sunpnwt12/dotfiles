local opts = {
	log_level = "info",
	auto_session_enable_last_session = false,
	auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",

	-- Enables/disables the plugin's auto save and restore features
	auto_session_enabled = true,

	-- Enables/disables the plugin's session auto creation
	auto_session_create_enabled = true,

	-- Enables/disables auto saving
	auto_save_enabled = false,

	-- Enables/disables auto restoring
	auto_restore_enabled = false,
}

return {
	"rmagatti/auto-session",
	opts = opts,
	cmd = { "SearchSession", "SessionSave", "SessionRestore" },
}
