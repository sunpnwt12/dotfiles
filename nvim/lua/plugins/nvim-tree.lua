-- local tree_on_attach = function(bufnr)
-- 	local api = require("nvim-tree.api")
-- 	api.config.mapping.default_on_attach(bufnr)
-- end
--
-- local config = function()
-- 	require("nvim-tree").setup({
-- 	})
-- end

return {
    "nvim-tree/nvim-tree.lua",
    config = true,
    cmd = "NvimTreeToggle",
}
