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
    },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},

    -- LSP 
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},         -- Required
        {'hrsh7th/cmp-nvim-lsp'},     -- Required
        {'hrsh7th/cmp-buffer'},       -- Optional
        {'hrsh7th/cmp-path'},         -- Optional
        {'saadparwaiz1/cmp_luasnip'}, -- Optional
        {'hrsh7th/cmp-nvim-lua'},     -- Optional

        -- Snippets
        {'L3MON4D3/LuaSnip'},             -- Required
        {'rafamadriz/friendly-snippets'}, -- Optional
    }
},
{"folke/trouble.nvim"},

-- Tree
{
    'kyazdani42/nvim-tree.lua',
    dependencies = {
        'kyazdani42/nvim-web-devicons' -- optional, for file icons
    }
},

-- Telescope
{
    'nvim-telescope/telescope.nvim',
    version = '0.1.0',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
},
{
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
},

-- BufferLine
{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
},
{
    'akinsho/bufferline.nvim',
    version = 'v2.*',
    dependencies = 'kyazdani42/nvim-web-devicons'
},

-- Git
{'lewis6991/gitsigns.nvim'},

-- Utilities
'lukas-reineke/indent-blankline.nvim',
{ 'windwp/nvim-autopairs',},
{
    'kylechui/nvim-surround',
    version = '*',
},
{ 'numToStr/Comment.nvim'},
}

local opts = {}

require("lazy").setup(plugins, opts)
