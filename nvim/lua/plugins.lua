local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- LSP
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
	},
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },

	-- Autocompletion
	{ "hrsh7th/nvim-cmp" }, -- Required
	{ "hrsh7th/cmp-nvim-lsp" }, -- Required
	{ "hrsh7th/cmp-buffer" }, -- Optional
	{ "hrsh7th/cmp-path" }, -- Optional
	{ "hrsh7th/cmp-nvim-lua" }, -- Optional
	{ "saadparwaiz1/cmp_luasnip" },

	-- Snippet
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	{ "rafamadriz/friendly-snippets" },

	-- Formatter & Diagnostics
	{ "jose-elias-alvarez/null-ls.nvim" },
	{ "folke/trouble.nvim" },

	-- DAP
	{ "rcarriga/nvim-dap-ui" },
	{ "mfussenegger/nvim-dap" },
	{ "mfussenegger/nvim-dap-python" },

	-- Tree
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.2",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{ "ThePrimeagen/harpoon" },
	-- BufferLine
	{
		"akinsho/bufferline.nvim",
		version = "*",
	},

	-- statusline
	{ "nvim-lualine/lualine.nvim" },

	-- Git
	{ "lewis6991/gitsigns.nvim" },

	-- Utilities
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "windwp/nvim-autopairs" },
	{
		"kylechui/nvim-surround",
		version = "*",
	},
	{ "numToStr/Comment.nvim" },
	{ "numToStr/Navigator.nvim" },
}

local opts = {}

require("lazy").setup(plugins, opts)
