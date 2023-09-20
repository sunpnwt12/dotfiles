local opts = {
	compile = false, -- enable compiling the colorscheme
	undercurl = true, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = false, -- do not set background color
	dimInactive = true, -- dim inactive window `:h hl-NormalNC`
	terminalColors = true, -- define vim.g.terminal_color_{0,17}
	overrides = function(colors)
		-- local theme = colors.theme
		return {
			Visual = { bg = 3552838 },
			Pmenu = { bg = 3552838 },
			PmenuSel = { bg = 3552838 },
			PmenuThumb = { bg = 3552838 },
		}
	end,
	theme = "wave", -- load "wave" theme when 'background' option is not set
	background = { -- map the value of 'background' option to a theme
		dark = "wave", -- try "dragon" !
		light = "lotus",
	},
	colors = {
		theme = {
			all = {
				ui = {
					bg_gutter = "none",
				},
			},
		},
	},
}

return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	opts = opts,
	priority = 1000,
	-- cond = false,
}
