local mason_opts = {
    ui = {
        border = "rounded",
    },
}

local mason_lsp_opts = {
    ensure_installed = {
        -- Replace these with whatever servers you want to install
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "tsserver",
        "marksman",
        "texlab",
    },
}

local mason_tool_installer_opts = {
    -- a list of all tools you want to ensure are installed upon
    -- start; they should be the names Mason uses for each tool
    ensure_installed = {
        -- DAP
        "debugpy",
        "codelldb",

        -- Formater & Linter
        "stylua",
        "black",
        "eslint_d",
        "markdownlint",
        "latexindent",

        -- Compiler
        "tectonic",
    },
    auto_update = false,
    run_on_start = true,
    start_delay = 3000, -- 3 second delay
    debounce_hours = 5, -- at least 5 hours between attempts to install/update
}

local lsp_config_conf = function()
    local lspconfig = require("lspconfig")
    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    local handlers = {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup({
                capabilities = lsp_capabilities,
            })
        end,
        -- Next, you can provide targeted overrides for specific servers.
        ["rust_analyzer"] = function()
            lspconfig.rust_analyzer.setup({
                capabilities = lsp_capabilities,
                cmp = {
                    "rustup",
                    "run",
                    "stable",
                    "rust_analyzer",
                },
                settings = {
                    ["rust-analyzer"] = {
                        checkOnSave = {
                            command = "clippy",
                        },
                    },
                },
            })
        end,

        ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
                capabilities = lsp_capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })
        end,

        ["texlab"] = function()
            lspconfig.texlab.setup({
                capabilities = lsp_capabilities,
                settings = {
                    taxlab = {
                        build = {
                            executable = "tectonic",
                            args = {
                                "-X",
                                "compile",
                                "%f",
                                "--synctex",
                                "--keep-logs",
                                "--keep-intermediates",
                            },
                            onSave = true,
                        },
                    },
                },
            })
        end,
    }

    require("mason-lspconfig").setup_handlers(handlers)
end

return {
    {
        "williamboman/mason.nvim",
        opts = mason_opts,
        build = ":MasonUpdate",
        cmd = "Mason",
        event = "BufReadPre",
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = mason_lsp_opts,
        event = "BufReadPre",
        dependencies = "williamboman/mason.nvim",
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = mason_tool_installer_opts,
        cmd = { "MasonToolsInstall", "MasonToolsUpdate" },
        dependencies = "williamboman/mason.nvim",
    },
    {
        "neovim/nvim-lspconfig",
        config = lsp_config_conf,
        event = "BufReadPre",
    },
}
