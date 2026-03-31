vim.api.nvim_create_autocmd("InsertEnter", {
	once = true,
	callback = function()
		vim.pack.add({ "https://github.com/windwp/nvim-autopairs" })
		local autopairs = require("nvim-autopairs")
		local rule = require("nvim-autopairs.rule")
		local cond = require("nvim-autopairs.conds")

		autopairs.setup({})

		autopairs.add_rules({
			rule("<", ">"):with_pair(cond.before_regex("%a+")):with_move(),
		})
	end,
})
