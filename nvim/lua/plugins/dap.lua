local dap_conf = function()
	-- You NEED to override nvim-dap's default highlight groups, AFTER requiring nvim-dap

	require("dap")
	local sign = vim.fn.sign_define

	sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
	sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
	sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

	require("dapui").setup()

	-- listen and automatically open dapui
	local dap, dapui = require("dap"), require("dapui")

	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end

	-- Codelldb
	-- start port automatically
	-- Dedicated plugin does not exist yet
	-- Load up with dap
	dap.adapters.codelldb = {
		type = "server",
		port = "${port}",
		executable = {
			-- CHANGE THIS to your path!
			--
			command = "~/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb",
			args = { "--port", "${port}" },

			-- On windows you may have to uncomment this:
			-- detached = false,
		},
	}
end

local dap_python_conf = function()
	-- Python
	-- require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
	require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
end

return {
	{
		"mfussenegger/nvim-dap",
		config = dap_conf,
		keys = {
			{ "<leader>b" },
			{ "<leader>B" },
			{ "<leader>lp" },
		},
		-- event = "BufReadPre",
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = "mfussenegger/nvim-dap",
		keys = {
			{ "<leader>b" },
			{ "<leader>B" },
			{ "<leader>lp" },
		},
		-- event = "BufReadPre",
	},
	{
		"mfussenegger/nvim-dap-python",
		config = dap_python_conf,
		ft = { "python" },
		dependencies = "mfussenegger/nvim-dap",
	},
}
