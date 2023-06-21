local function get_config(name)
    return string.format("require('config/%s')", name)
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use { 'andymass/vim-matchup', event = 'VimEnter' }

    use {
        'w0rp/ale',
        ft = {
            'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown',
            'racket', 'vim', 'tex'
        },
        cmd = 'ALEEnable',
        config = 'vim.cmd[[ALEEnable]]'
    }

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = get_config('gitsigns')
    }

    -- LSP Plugins
    use { 'neovim/nvim-lspconfig', config = get_config('lsp-config') }
    use {
        'glepnir/lspsaga.nvim',
        branch = 'main',
        config = get_config('lspsaga')
    }
    use { 'williamboman/mason.nvim', config = get_config('lsp-config') }
    use { 'williamboman/mason-lspconfig.nvim', config = get_config('lsp-config') }
    use { 'L3MON4D3/LuaSnip' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'hrsh7th/nvim-cmp', config = get_config('cmp') }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = get_config('null-ls')
    }
    use {
        'folke/trouble.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = get_config('trouble')
    }

    -- My Plugins
    use {
        'kyazdani42/nvim-tree.lua',
        config = get_config('nvim-tree'),
        requires = {
            'kyazdani42/nvim-web-devicons' -- optional, for file icons
        }
    }

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = get_config('telescope')
    }

    use { 'nvim-telescope/telescope-file-browser.nvim' }

    use {
        'catppuccin/nvim',
        as = 'catppuccin',
        config = get_config('catppuccin')
    }

    use {
        'nvim-lualine/lualine.nvim',
        config = get_config('lualine'),
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {
        'akinsho/bufferline.nvim',
        tag = 'v2.*',
        config = get_config('bufferline'),
        requires = 'kyazdani42/nvim-web-devicons'
    }

    use 'lukas-reineke/indent-blankline.nvim'

    use { 'windwp/nvim-autopairs', config = get_config('nvim-autopairs') }

    use {
        'kylechui/nvim-surround',
        tag = '*',
        config = get_config('nvim-surround')
    }

    use { 'numToStr/Comment.nvim', config = get_config('Comment') }

end)
