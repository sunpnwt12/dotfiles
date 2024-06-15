local dap_conf = function()
    -- You NEED to override nvim-dap's default highlight groups, AFTER requiring nvim-dap
    local mason_registry = require("mason-registry")

    local codelldb = mason_registry.get_package("codelldb")
    local extesion_path = codelldb:get_install_path() .. "/extension/"
    local codelldb_path = extesion_path .. "adapter/codelldb"

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
            -- command = "~/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb",
            command = codelldb_path,
            args = { "--port", "${port}" },

            -- On windows you may have to uncomment this:
            -- detached = false,
        },
        -- showDisassembly = "never",
    }
end

local dap_python_conf = function()
    -- Python
    require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
end

local trigger_keys = {
    { "<leader>b",  "<CMD>lua require('dap').toggle_breakpoint()<CR>" },
    { "<leader>B",  "<CMD>lua require('dap').set_breakpoint(vim.fn.input('Break Point Condition: '))<CR>" },
    { "<leader>lp", "<CMD>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log Point Msg: '))<CR>" },
}

return {
    {
        "mfussenegger/nvim-dap",
        config = dap_conf,
        keys = trigger_keys,
        -- ft = { "python" },
        -- event = "LspAttach",
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            'nvim-neotest/nvim-nio'
        },
        keys = trigger_keys,
        -- ft = { "python" },
        -- event = "LspAttach",
    },
    {
        "mfussenegger/nvim-dap-python",
        config = dap_python_conf,
        dependencies = "mfussenegger/nvim-dap",
        keys = trigger_keys,
    },
}
