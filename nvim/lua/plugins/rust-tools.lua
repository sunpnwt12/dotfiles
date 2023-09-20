local config = function()
	local rt = require("rust-tools")
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
	local mason_registry = require("mason-registry")

	local codelldb = mason_registry.get_package("codelldb")
	local extesion_path = codelldb:get_install_path() .. "/extension/"
	local codelldb_path = extesion_path .. "adapter/codelldb"
	local liblldb_path = extesion_path .. "lldb/lib/liblldb.so"

	rt.setup({
		dap = {
			adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
		},

		-- rust-tools will overrides lspconfig
		server = {
			standalone = true,
			capabilities = lsp_capabilities,
			settings = {
				["rust-analyzer"] = {
					checkOnSave = {
						command = "clippy",
					},
				},
			},
		},
		tools = {
			executor = require("rust-tools.executors").toggleterm,
			hover_actions = {
				auto_focus = true,
			},
		},
	})
end

return {
	"simrat39/rust-tools.nvim",
	config = config,
	-- event = "BufReadPre",
	ft = { "rust" },
}
