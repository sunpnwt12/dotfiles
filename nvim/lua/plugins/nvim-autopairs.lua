local config = function()
	local autopairs = require("nvim-autopairs")
	local rule = require("nvim-autopairs.rule")
	local cond = require("nvim-autopairs.conds")

	autopairs.setup({})

	autopairs.add_rules({
		rule("<", ">"):with_pair(cond.before_regex("%a+")):with_move(),
	})
end
return {
	"windwp/nvim-autopairs",
	cond = true,
	config = config,
	event = "InsertEnter",
}
