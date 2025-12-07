local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.term = "xterm-256color"
config.default_domain = "WSL:Ubuntu-22.04"
config.initial_rows = 24
config.initial_cols = 100

-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "Kanagawa (Gosh)"
config.colors = {
	cursor_fg = "black",
}
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 12.0
config.line_height = 1.2
-- config.hide_tab_bar_if_only_one_tab = true
-- config.use_fancy_tab_bar = false
-- config.window_frame = {font_size = 12.0}
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_background_opacity = 1.0
config.window_close_confirmation = "NeverPrompt"

return config
