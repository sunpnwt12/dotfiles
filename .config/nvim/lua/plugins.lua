local function get_config(name)
    return string.format("require('config/%s')", name)
end

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
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        config = get_config('catppuccin')
    },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    {
        'lewis6991/gitsigns.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = get_config('gitsigns')
    },

    -- LSP Plugins

    {
        'williamboman/mason.nvim',
        config = get_config('lsp-config'),
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = get_config('lsp-config'),
    },
    'neovim/nvim-lspconfig',
    {
        'glepnir/lspsaga.nvim',
        branch = 'main',
        config = get_config('lspsaga')
    },
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    { 'hrsh7th/nvim-cmp', config = get_config('cmp') },
    'hrsh7th/cmp-nvim-lsp',
    {
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = get_config('null-ls')
    },
    {
        'folke/trouble.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
        config = get_config('trouble')
    },

    -- My Plugins
    {
        'kyazdani42/nvim-tree.lua',
        config = get_config('nvim-tree'),
        dependencies = {
            'kyazdani42/nvim-web-devicons' -- optional, for file icons
        }
    },
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.0',
        dependencies = { { 'nvim-lua/plenary.nvim' } },
        config = get_config('telescope')
    },
    { 'nvim-telescope/telescope-file-browser.nvim' },
    {
        'nvim-lualine/lualine.nvim',
        config = get_config('lualine'),
        dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
    },
    {
        'akinsho/bufferline.nvim',
        version = 'v2.*',
        config = get_config('bufferline'),
        dependencies = 'kyazdani42/nvim-web-devicons'
    },
    'lukas-reineke/indent-blankline.nvim',
    { 'windwp/nvim-autopairs', config = get_config('nvim-autopairs') },
    {
        'kylechui/nvim-surround',
        version = '*',
        config = get_config('nvim-surround')
    },
    { 'numToStr/Comment.nvim', config = get_config('Comment') },
}

local opts = {}

require("lazy").setup(plugins, opts)
