local config = function()
	local autopairs = require("nvim-autopairs")
	local Rule = require("nvim-autopairs.rule")
	local cond = require("nvim-autopairs.conds")

	autopairs.setup({})

	autopairs.add_rules({
		Rule("<", ">"):with_pair(cond.before_regex("%a+")):with_move(),
	})
end
return {
	"windwp/nvim-autopairs",
	config = config,
	event = "InsertEnter",
}
