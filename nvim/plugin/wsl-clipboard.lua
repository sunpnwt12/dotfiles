vim.pack.add({ "https://github.com/lmgraf/wsl-clipboard.nvim" })
require("wsl-clipboard").setup({
	mode = "sync", -- options: "system", "sync", "focus"
})
