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

		-- Navigation through hunk
		map("n", "]g", function()
			if vim.wo.diff then
				return "]g"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[g", function()
			if vim.wo.diff then
				return "[g"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Stage/Reset hunk indivitually
		map({ "n", "v" }, "<leader>gs", "<CMD>Gitsigns stage_hunk<CR>")
		map({ "n", "v" }, "<leader>gr", "<CMD>Gitsigns reset_hunk<CR>")
		map("n", "<leader>gu", "<CMD>Gitsigns undo_stage_hunk<CR>")

		-- Stage/Reset hunk in the buffer
		map("n", "<leader>gS", "<CMD>Gitsigns stage_buffer<CR>")
		map("n", "<leader>gR", "<CMD>Gitsigns reset_buffer<CR>")
		map("n", "<leader>gU", "<CMD>Gitsigns reset_buffer_index<CR>")

		-- Preview hunk
		map("n", "<leader>gp", "<CMD>Gitsigns preview_hunk<CR>")

		-- blame
		map("n", "<leader>gb", '<CMD>lua require"gitsigns".blame_line{full=true}<CR>')
		map("n", "<leader>tb", "<CMD>Gitsigns toggle_current_line_blame<CR>")

		-- diff
		map("n", "<leader>gd", "<CMD>Gitsigns diffthis<CR>")
		map("n", "<leader>gD", '<CMD>lua require("gitsigns").diffthis("~")<CR>')
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
