local config = function()
	local null_ls = require("null-ls")
	local formatting = null_ls.builtins.formatting

	null_ls.setup({
		sources = {
			-- lua
			formatting.stylua,

			-- python
			formatting.black,

			-- rust
			formatting.rustfmt,

			-- ts/js
			formatting.eslint,

			-- markdown
			formatting.markdownlint,
		},
	})
end

return {
	"jose-elias-alvarez/null-ls.nvim",
	config = config,
	event = "BufReadPre",
}
