local config = function()
	require("bufferline").setup({
		options = {
            -- stylua: ignore
            close_command = function(n) Snacks.bufdelete(n) end,
            -- stylua: ignore
            right_mouse_command = function(n) Snacks.bufdelete(n) end,
			themable = false,
			-- offsets = {
			--     {
			--         filetype = "NvimTree",
			--         text = "File Explorer",
			--         text_align = "center",
			--         seprator = true,
			--     },
			-- },
			buffer_close_icon = "󰅖",
			modified_icon = "●",
			close_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",
			separator_style = { "", "" },
			-- indicator = {
			-- 	icon = "▎", -- this should be omitted if indicator style is not 'icon'
			-- 	style = "icon",
			-- },
		},
		-- highlights = require("catppuccin.groups.integrations.bufferline").get(),
	})
end

return {
	"akinsho/bufferline.nvim",
	config = config,
}
