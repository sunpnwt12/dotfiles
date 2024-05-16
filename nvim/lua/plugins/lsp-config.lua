-- :h lspconifg-all (for all list and configurations of servers)

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local bufopts = { buffer = ev.buf }
        -- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", bufopts)
        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", bufopts)
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", bufopts)
        vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", bufopts)
        vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<CR>", bufopts)
        -- vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", bufopts) -- use trouble.nvim instead
        vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", bufopts)
        vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", bufopts)
        vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = false})<CR>", bufopts)
        vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", bufopts)
        vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", bufopts)
        vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", bufopts)
        -- vim.keymap.set("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", bufopts) -- use trouble.nvim instead
    end,
})

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
        'ruff',
        -- "mypy",
        "rust_analyzer",
        "marksman",
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
        "prettierd",
        "ruff",
        "markdownlint",
    },
    auto_update = false,
    run_on_start = true,
    start_delay = 3000, -- 3 second delay
    debounce_hours = 5, -- at least 5 hours between attempts to install/update
}

for _, v in pairs(mason_lsp_opts.ensure_installed) do
    table.insert(mason_tool_installer_opts.ensure_installed, v)
end

local lsp_config_conf = function()
    require("lspconfig.ui.windows").default_options.border = "rounded"
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        -- Use a sharp border with `FloatBorder` highlights
        border = "rounded",
    })
    local lspconfig = require("lspconfig")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    local handlers = {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function(server_name) -- default handler (optional)
            -- if server_name == "rust_analyzer" then goto continue end
            require("lspconfig")[server_name].setup({
                capabilities = lsp_capabilities,
            })
            -- ::continue::
        end,
        -- Next, you can provide targeted overrides for specific servers.
        -- ["rust_analyzer"] = function()
        -- 	lspconfig.rust_analyzer.setup({
        -- 		capabilities = lsp_capabilities,
        -- 		settings = {
        -- 			["rust-analyzer"] = {
        -- 				checkOnSave = {
        -- 					command = "clippy",
        -- 				},
        -- 			},
        -- 		},
        -- 	})
        -- end,

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
    }

    require("mason-lspconfig").setup_handlers(handlers)
    require("lspconfig").mojo.setup({ capabilities = lsp_capabilities })

    vim.diagnostic.config({
        float = { border = "rounded" },
    })
end

return {
    {
        "williamboman/mason.nvim",
        opts = mason_opts,
        build = ":MasonUpdate",
        cmd = "Mason",
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = mason_lsp_opts,
        event = { "BufReadPre", "BufNewFile" },
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
        event = { "BufReadPre", "BufNewFile" },
    },
}
