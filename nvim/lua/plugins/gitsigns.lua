local opts = {
	preview_config = {
		-- Options passed to nvim_open_win
		border = "rounded",
	},
	on_attach = function(bufnr)
		local gs = require("gitsigns")

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Actions
		map({ "n", "v" }, "<leader>hs", "<CMD>Gitsigns stage_hunk<CR>")
		map({ "n", "v" }, "<leader>hr", "<CMD>Gitsigns reset_hunk<CR>")
		map("n", "<leader>hS", "<CMD>Gitsigns stage_buffer<CR>")
		map("n", "<leader>hu", "<CMD>Gitsigns undo_stage_hunk<CR>")
		map("n", "<leader>hR", "<CMD>Gitsigns reset_buffer<CR>")
		map("n", "<leader>hp", "<CMD>Gitsigns preview_hunk<CR>")
		map("n", "<leader>hb", '<CMD>lua require"gitsigns".blame_line{full=true}<CR>')
		map("n", "<leader>tb", "<CMD>Gitsigns toggle_current_line_blame<CR>")
		map("n", "<leader>hd", "<CMD>Gitsigns diffthis<CR>")
		map("n", "<leader>hD", '<CMD>lua require"gitsigns".diffthis("~")<CR>')
		map("n", "<leader>td", "<CMD>Gitsigns toggle_deleted<CR>")

		-- Text object
		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
}

return {
	"lewis6991/gitsigns.nvim",
	opts = opts,
	event = { "BufReadPre", "BufNewFile" },
}
