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
