vim.pack.add({ "https://github.com/folke/snacks.nvim" })
require("snacks").setup({
	picker = { enabled = true },
	input = { enabled = true },
	lazygit = { enabled = true },
	indent = {
		priority = 1,
		enabled = true, -- enable indent guides
		char = "│",
		only_scope = false, -- only show indent guides of the scope
		only_current = false, -- only show indent guides in the current window
		hl = "SnacksIndent", -- @type string|string[] hl groups for indent guides
		animate = {
			-- enabled = vim.fn.has("nvim-0.10") == 1,
			enabled = false,
		},
	},
})

vim.api.nvim_create_user_command("BD", function(n)
	Snacks.bufdelete(n)
end, {})

local map = vim.keymap.set
local function defaults_opts_with(extra_desc)
	return { noremap = true, silent = true, desc = extra_desc }
end

-- stylua: ignore start
-- Lazygit
map("n", "<leader>lg", function() Snacks.lazygit.open() end,  defaults_opts_with( "Open lazygit"))
map("n", "<leader>ll", function() Snacks.lazygit.log_file() end, defaults_opts_with( "opens lazygit with the log of the current file"))
-- find
map("n", "<leader>fb", function() Snacks.picker.buffers() end, defaults_opts_with( "Buffers"))
map("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, defaults_opts_with( "Find Config File"))
map("n", "<leader>ff", function() Snacks.picker.files() end,{ noremap = true, silent = true}) -- defaults_opts_with( "Find Files"))
map("n", "<leader>fg", function() Snacks.picker.git_files() end, defaults_opts_with( "Find Git Files"))
map("n", "<leader>fp", function() Snacks.picker.projects() end, defaults_opts_with( "Projects"))
map("n", "<leader>fr", function() Snacks.picker.recent() end, defaults_opts_with( "Recent"))
-- git
map("n", "<leader>gb", function() Snacks.picker.git_branches() end, defaults_opts_with( "Git Branches"))
map("n", "<leader>gl", function() Snacks.picker.git_log() end, defaults_opts_with( "Git Log"))
map("n", "<leader>gL", function() Snacks.picker.git_log_line() end, defaults_opts_with( "Git Log Line"))
map("n", "<leader>gs", function() Snacks.picker.git_status() end, defaults_opts_with( "Git Status"))
map("n", "<leader>gS", function() Snacks.picker.git_stash() end, defaults_opts_with( "Git Stash"))
map("n", "<leader>gd", function() Snacks.picker.git_diff() end, defaults_opts_with( "Git Diff (Hunks)"))
map("n", "<leader>gf", function() Snacks.picker.git_log_file() end, defaults_opts_with( "Git Log File"))
-- Grep
map("n", "<leader>sb", function() Snacks.picker.lines() end, defaults_opts_with( "Buffer Lines"))
map("n", "<leader>sB", function() Snacks.picker.grep_buffers() end, defaults_opts_with( "Grep Open Buffers"))
map("n", "<leader>sg", function() Snacks.picker.grep() end, defaults_opts_with( "Grep"))
map("n", "<leader>sw", function() Snacks.picker.grep_word() end, defaults_opts_with( "Visual selection or word"))
-- - - search
-- map("n", "<leader>s", function() Snacks.picker.registers() end, defaults_opts_with( "Registers"))
-- map("n", "<leader>s/", function() Snacks.picker.search_history() end, defaults_opts_with( "Search History"))
-- map("n", "<leader>sa", function() Snacks.picker.autocmds() end, defaults_opts_with( "Autocmds"))
-- map("n", "<leader>sb", function() Snacks.picker.lines() end, defaults_opts_with( "Buffer Lines"))
-- map("n", "<leader>sc", function() Snacks.picker.command_history() end, defaults_opts_with( "Command History"))
-- map("n", "<leader>sC", function() Snacks.picker.commands() end, defaults_opts_with( "Commands"))
-- map("n", "<leader>sd", function() Snacks.picker.diagnostics() end, defaults_opts_with( "Diagnostics"))
-- map("n", "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, defaults_opts_with( "Buffer Diagnostics"))
-- map("n", "<leader>sh", function() Snacks.picker.help() end, defaults_opts_with( "Help Pages"))
-- map("n", "<leader>sH", function() Snacks.picker.highlights() end, defaults_opts_with( "Highlights"))
-- map("n", "<leader>si", function() Snacks.picker.icons() end, defaults_opts_with( "Icons"))
-- map("n", "<leader>sj", function() Snacks.picker.jumps() end, defaults_opts_with( "Jumps"))
map("n", "<leader>sk", function() Snacks.picker.keymaps() end, defaults_opts_with( "Keymaps" ))
-- map("n", "<leader>sl", function() Snacks.picker.loclist() end, defaults_opts_with( "Location List" ))
-- map("n", "<leader>sm", function() Snacks.picker.marks() end, defaults_opts_with( "Marks" ))
-- map("n", "<leader>sM", function() Snacks.picker.man() end, defaults_opts_with( "Man Pages" ))
-- map("n", "<leader>sp", function() Snacks.picker.lazy() end, defaults_opts_with( "Search for Plugin Spec" ))
-- map("n", "<leader>sq", function() Snacks.picker.qflist() end, defaults_opts_with( "Quickfix List" ))
-- map("n", "<leader>sR", function() Snacks.picker.resume() end, defaults_opts_with( "Resume" ))
map("n", "<leader>su", function() Snacks.picker.undo() end, defaults_opts_with( "Undo History" ))
-- { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes"
-- -- LSP
-- map("n", "gd", function() Snacks.picker.lsp_definitions() end, defaults_opts_with( "Goto Definition" ))
-- map("n", "gD", function() Snacks.picker.lsp_declarations() end, defaults_opts_with( "Goto Declaration" ))
-- map("n", "gr", function() Snacks.picker.lsp_references() end,  defaults_opts_with( "References" ))
-- map("n", "gI", function() Snacks.picker.lsp_implementations() end, defaults_opts_with( "Goto Implementation" ))
-- map("n", "gy", function() Snacks.picker.lsp_type_definitions() end, defaults_opts_with( "Goto T[y]pe Definition" ))
map("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, defaults_opts_with( "LSP Symbols" ))
map("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, defaults_opts_with( "LSP Workspace Symbols" ))
-- stylua: ignore start
